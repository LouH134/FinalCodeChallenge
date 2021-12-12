//
//  LHProfileViewController.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/10/21.
//

import UIKit

class LHProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    var categoriesSetup: CategoriesInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        categoriesSetup = CategoriesInfo()
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
        
        return cell
    }
    
    //MARK: - TableView Setup
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    //TO DO: Network connections to get username,firstname,lastname then update cell label with data. Then Do network save when buttons pressed and go to the next screen

}
