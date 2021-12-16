//
//  FakeGetMyProfileUseCase.swift
//  FinalCodeChallenge
//
//  Created by Daniel Hu on 2021-12-15.
//

import Foundation
import Alamofire

struct FakeGetMyProfileUseCase: AGetMyProfileUseCase {
    
    let isSuccess: Bool
    
    func getMyProfile(_ completion: @escaping (Result<User, Error>) -> Void) {
        guard let data = readDataFromLocalFile(forName: isSuccess ? "UserProfileResponse" : "ErrorResponse") else {
            completion(.failure(MyError.customMessage("failed to load fake data")))
            return
        }
        
        do {
            let envelop = try JSONDecoder().decode(Envelop<User>.self, from: data)
            completion(.success(envelop.data))
        } catch let decodingError as DecodingError {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let msg = jsonObject["msg"] as? String {
                completion(.failure(MyError.customMessage(msg)))
            } else {
                completion(.failure(decodingError))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
}
