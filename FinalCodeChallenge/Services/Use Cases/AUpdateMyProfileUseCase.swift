//
//  AUpdateMyProfileUseCase.swift
//  FinalCodeChallenge
//
//  Created by Daniel Hu on 2021-12-15.
//

import Foundation

protocol AUpdateMyProfileUseCase {
    
    func updateProfile(with newProfile: User, completion: @escaping (Result<User, Error>) -> Void)
    
}
