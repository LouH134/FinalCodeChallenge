//
//  UIView+.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/10/21.
//

import UIKit

extension UIView{
    var parentViewController: UIViewController?{
        var parentResponder: UIResponder? = self
        
        while parentResponder != nil{
            parentResponder = parentResponder!.next
            
            if let viewController = parentResponder as? UIViewController{
                return viewController
            }
        }
        return nil
    }
    
    //MARK: - Button Functions
    func dismiss(){
        UIView.animate(withDuration: 0.25, animations: {
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.alpha = 0.0;
        }, completion: {(finished : Bool) in
            if (finished){
                self.removeFromSuperview()
            }
        });
   }
    
    //MARK: - Animations
    open func showInView(_ aView: UIView!, animated: Bool){
        aView.addSubview(self)
        if animated{
            self.showAnimate()
        }
    }
    
    open func showInView(_ aView: UIView!, animated: Bool, onComplete: @escaping () -> Void){
        aView.addSubview(self)
        if animated{
        }
    }
    
    private func showAnimate(){
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
}
