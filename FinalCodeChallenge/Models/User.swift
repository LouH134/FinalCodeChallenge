//
//  User.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/12/21.
//

import Foundation

class User: Codable{
    var username: String?
    var firstName: String?
    var lastName: String?
    
    init(username: String, firstName: String, lastName: String){
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(){
        
    }
}
