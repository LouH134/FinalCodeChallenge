//
//  NetworkManager.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/13/21.
//

import Foundation
import Alamofire

class NetworkManager: AGetMyProfileUseCase, AUpdateMyProfileUseCase, AUpdatePasswordUseCase {
    static let shared: NetworkManager = {
        return NetworkManager()
    }()
    
    var viewController: UIViewController?
    
    init(){
        
    }
    
    fileprivate func newJSONDecoder() -> JSONDecoder{
        let decoder = JSONDecoder()
        
        return decoder
    }
    
    func decode<T: Codable>(item: T.Type, data: Data) -> (T?, Error?){
        do{
            let returnObject = try newJSONDecoder().decode(item.self, from: data)
            
            return (returnObject, nil)
        }catch let error{
            #if DEBUG
            
            debugPrint("ERROR DATA:  \(error)")
            
            #endif
            
            return (nil, error)
        }
    }
    
    
    private static func switchAndComplete<T: Decodable>(dataResponse: DataResponse<Envelop<T>, AFError>,
                                                        completion: (Result<T, Error>) -> Void) {
        switch dataResponse.result {
        case .success(let envelop):
            completion(.success(envelop.data))
            
        case .failure(let afError):
            completion(.failure(afError))
        }
    }
    
    func getMyProfile(_ completion: @escaping (Result<User, Error>) -> Void) {
        AF.request("url.com/profiles/me").validate().responseDecodable(of: Envelop<User>.self) { response in
            Self.switchAndComplete(dataResponse: response, completion: completion)
        }
    }
    
    func updateProfile(with newProfile: User, completion: @escaping (Result<User, Error>) -> Void) {
        
        AF.request("URL/profiles/update",
                   method: .post,
                   parameters: newProfile,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: Envelop<User>.self)
        { response in
            Self.switchAndComplete(dataResponse: response, completion: completion)
        }
    }
    
    
    func updatePassword(with body: UpdatePasswordRequest, completion: @escaping (Error?) -> Void) {
        AF.request("URL/profiles/password/change",
                   method: .post,
                   parameters: body,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: Envelop<VoidCodable?>.self)
        { response in
            completion(response.error)
        }
    }
    
    
}
