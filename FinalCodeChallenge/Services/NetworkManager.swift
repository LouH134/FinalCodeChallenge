//
//  NetworkManager.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/13/21.
//

import Foundation
import Alamofire

class NetworkManager: AGetMyProfileUseCase, AUpdateMyProfileUseCase, AUpdatePasswordUseCase {
    static let shared: NetworkManager = .init()
    
    
    private init(){ }
    
    // MARK: - Helpers
    
    private static func switchAndComplete<T: Decodable>(dataResponse: DataResponse<Envelop<T>, AFError>,
                                                        completion: (Result<T, Error>) -> Void) {
        switch dataResponse.result {
        case .success(let envelop):
            completion(.success(envelop.data))
            
        case .failure(let afError):
            completion(.failure(afError))
        }
    }
    
    // MARK: - APIs
    
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
