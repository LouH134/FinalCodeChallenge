//
//  AUpdatePasswordUseCase.swift
//  FinalCodeChallenge
//
//  Created by Daniel Hu on 2021-12-15.
//

import Foundation

protocol AUpdatePasswordUseCase {
    
    func updatePassword(with body: UpdatePasswordRequest, completion: @escaping (Result<Void, Error>) -> Void)
    
}
