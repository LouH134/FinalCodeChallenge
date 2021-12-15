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
        if isSuccess,
           let data = readDataFromLocalFile(forName: "UserProfileResponse"),
           let envelop = try? JSONDecoder().decode(Envelop<User>.self, from: data)
        {
            completion(.success(envelop.data))
        } else {
            completion(.failure(NSError(domain: "fake", code: 0, userInfo: [NSLocalizedDescriptionKey: "failed to load fake data"])))
        }
    }
    
}
