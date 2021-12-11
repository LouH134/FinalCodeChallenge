//
//  ViewController+.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/10/21.
//

import UIKit

extension UIViewController{
    static func storyboardInstance(storyboardName: String) -> UIViewController{
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: String(describing: self))
    }
}
