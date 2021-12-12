//
//  CategoriesInfo.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/12/21.
//

import Foundation

class CategoriesInfo{
    var data: [ProfileSection] = []
    
    init(){
        categoriesInfoSetup()
    }
    
    func categoriesInfoSetup(){
        data.append(ProfileSection(title: "Basic Information", items: [ProfileItem(title: "Username"), ProfileItem(title: "First Name"), ProfileItem(title: "Last Name")]))
    }
}
