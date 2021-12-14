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
    
    func showMessage(title: String?, message: String?, okTxt: String? = "OK", onComplete: @escaping (Bool) -> Void){
        let vi = LHAlertView(frame: self.view.frame, title: title, messsage: message, okText: okTxt)
        
        vi.showInView(self.view, animated: true)
        vi.didPressOkButton = {
            onComplete(true)
        }
        
        
    }
}
