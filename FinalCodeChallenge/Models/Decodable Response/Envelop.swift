//
//  Envelop.swift
//  FinalCodeChallenge
//
//  Created by Daniel Hu on 2021-12-15.
//

import Foundation

struct Envelop<Content: Decodable>: Decodable {
    
    let message: String?
    let code: Int
    let data: Content
 
    enum CodingKeys: String, CodingKey {
        case message = "msg"
        case code = "msg_code"
        case data
    }
    
}
