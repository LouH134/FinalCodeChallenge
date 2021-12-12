//
//  LHAlertView.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/11/21.
//

import UIKit

class LHAlertView: UIView{
    var view: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    var didPressOkButton: (() -> Void)?
    
    
    func loadViewFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LHAlertView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    init(frame: CGRect, title: String? = "", messsage: String? = "", okText: String? = "OK"){
        super.init(frame: frame)
        
        xibSetup()
        
        lblTitle.text = title
        lblMessage.text = messsage
        okBtn.setTitle(okText, for: .normal)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - IBAction
    
    @IBAction func okBtnPressed(_ sender: Any) {
        self.didPressOkButton?()
        self.dismiss()
    }
    
    
}
