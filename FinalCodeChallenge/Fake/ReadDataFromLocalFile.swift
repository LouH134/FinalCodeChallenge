//
//  ReadDataFromLocalFile.swift
//  FinalCodeChallenge
//
//  Created by Daniel Hu on 2021-12-15.
//

import Foundation

func readDataFromLocalFile(forName name: String) throws -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}
