//
//  JSONResponse.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/13/21.
//

import Foundation

class JSONResponse: Codable{
    let message: String
    let messageCode: Int
    let firstName: String
    let lastName: String
    let username: String
    
    init(message: String, messageCode: Int, firstName: String, lastName: String, username: String){
        self.message = message
        self.messageCode = messageCode
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
       
    }
}

