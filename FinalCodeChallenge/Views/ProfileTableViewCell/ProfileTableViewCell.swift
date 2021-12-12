//
//  ProfileTableViewCell.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/12/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblName: UILabel!
    var item: ProfileItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(data: ProfileItem){
        item = data
        lblCategory.text = data.title
    }
    
}
