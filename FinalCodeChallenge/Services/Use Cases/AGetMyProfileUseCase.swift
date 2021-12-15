//
//  AGetMyProfileUseCase.swift
//  FinalCodeChallenge
//
//  Created by Daniel Hu on 2021-12-15.
//

import Foundation

protocol AGetMyProfileUseCase {
    
    func getMyProfile(_ completion: @escaping (Result<User, Error>) -> Void)
    
}
