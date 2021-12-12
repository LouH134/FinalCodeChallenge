//
//  ProfileSection.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/12/21.
//

import Foundation

class ProfileSection{
    var title: String!
    var items: [ProfileItem]!
    
    init(title: String, items: [ProfileItem]){
        self.title = title
        self.items = items
    }
}
