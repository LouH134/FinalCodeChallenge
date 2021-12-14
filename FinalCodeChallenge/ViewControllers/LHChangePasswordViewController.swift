//
//  LHChangePasswordViewController.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/11/21.
//

import UIKit

class LHChangePasswordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }
    
    //MARK: Tableview Setup
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "ChangePasswordTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "ChangePasswordTableViewCell")
    }
    
    //MARK: - Tableview Protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ChangePasswordTableViewCell", for: indexPath) as! ChangePasswordTableViewCell
        //grab the placeholder text from the cell and set it.
        
        
        return cell
    }
    

    
    // MARK: - IBAction

    
    @IBAction func changePasswordBtnPressed(_ sender: Any) {
        //ProgressHUD starts
//        NetworkManager.shared.updatePassword(oldPassword: <#T##String#>, newPassword: <#T##String#>, completion: <#T##(JSONResponse?, Error?) -> Void#>)
        //get the text from the tableview
        //if theres an error call LHAlertView
        //ProgressHUD Stops
    }
    

}
