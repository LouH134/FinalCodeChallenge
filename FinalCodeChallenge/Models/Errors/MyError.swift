//
//  MyError.swift
//  FinalCodeChallenge
//
//  Created by 胡洞明 on 2021-12-16.
//

import Foundation


enum MyError: LocalizedError {
    
    case customMessage(String)
    
    var errorDescription: String? {
        switch self {
        case .customMessage(let string):
            return string
        }
    }
    
}
