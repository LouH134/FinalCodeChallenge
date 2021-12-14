//
//  NetworkManager.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/13/21.
//

import Foundation
import Alamofire

class NetworkManager{
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
    
    func getUser(){
        AF.request("url.com/profiles/me").validate().responseDecodable(of: User.self){
            (response) in
            guard let users = response.value else {return}
            print(users)
        }
    }
    
    func updateUser(firstName: String, lastName: String, username: String, completion: @escaping(JSONResponse?, Error?) -> Void){
        let parameters: Parameters = [
            "firstName": "firstName", "lastName": "lastName", "username": "username"]
        
        AF.request("URL/profiles/update", method: .post, parameters: parameters).responseData(completionHandler: {
            response in
            
            switch response.result{
            case .success(let data):
                let completionResponse = self.decode(item: JSONResponse.self, data: data)
                print(completionResponse.0)
                break
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func updatePassword(oldPassword: String, newPassword: String, completion: @escaping(JSONResponse?, Error?) -> Void){
        let parameters: Parameters = ["oldPassword": "oldPassword", "newPassword": "newPassword"]
        
        AF.request("URL/profiles/password/change", method: .post, parameters: parameters).responseData(completionHandler: {
            response in
            
            switch response.result{
            case .success(let data):
                let completionResponse = self.decode(item: JSONResponse.self, data: data)
                print(completionResponse.0)
                break
                
            case .failure(let error):
                print(error)
            }
        })
    }
}
