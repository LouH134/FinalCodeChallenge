//
//  HeaderView.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/10/21.
//

import UIKit

@IBDesignable
class HeaderView: UIView{
    var view: UIView!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    func loadViewFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "HeaderView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    //MARK: - IBDesignables
    @IBInspectable var setBtnTitle: String = ""{
        didSet{
            btnBack.titleLabel?.text = setBtnTitle
        }
    }
    
    @IBInspectable var setTitle: String = ""{
        didSet{
            lblTitle.text = setTitle
        }
    }
    
    @IBInspectable var backButtonImage: UIImage = UIImage(){
        didSet{
            btnBack.setImage(backButtonImage, for: .normal)
        }
    }
    
    @IBInspectable var enableButton: Bool = false{
        didSet{
            btnBack.isEnabled = enableButton
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
    }
    
    
}
