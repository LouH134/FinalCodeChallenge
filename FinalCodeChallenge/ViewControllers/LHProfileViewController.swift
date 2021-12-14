//
//  LHProfileViewController.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/10/21.
//

import UIKit
import ProgressHUD

class LHProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    var categoriesSetup: CategoriesInfo?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.show()

        setUpTableView()
        categoriesSetup = CategoriesInfo()
        NetworkManager.shared.getUser()
        ProgressHUD.dismiss()
        //Some how connect user to NetworkManager getUser
    }
    

    
    // MARK: - TableView Protocols
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoriesSetup!.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesSetup!.data[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        
        let item = categoriesSetup!.data[indexPath.section].items[indexPath.row]
        cell.updateData(data: item)
        
        //somehow connect user to cell's name label
        
        return cell
    }
    
    //MARK: - TableView Setup
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "ProfileTableViewCell")
        
        tableView.reloadData()
    }
    
    //TO DO: Figure out why it crashed.Something to do with the label category. Network connections to get username,firstname,lastname then update cell label with data. Then Do network save when buttons pressed, figure out the error for the save
    
    
    //MARK: - IBAction
    @IBAction func saveBtnPressed(_ sender: Any) {
//        ProgressHUD.show()
//
//        NetworkManager.shared.updateUser(firstName: user?.firstName ?? "", lastName: user?.lastName ?? "", username: user?.username ?? "", completion: {
//            error in
//
//            if error != nil{
//                self.showMessage(title: "Problem", message: "\(error)", onComplete: <#T##(Bool) -> Void#>)
//            }
//            ProgressHUD.dismiss()
//        })
    }
    
    @IBAction func changePasswordBtnPressed(_ sender: Any) {
        let vc = LHChangePasswordViewController.storyboardInstance(storyboardName: "Main")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
