//
//  LHProfileViewController.swift
//  FinalCodeChallenge
//
//  Created by Louis Harris on 12/10/21.
//

import UIKit
import ProgressHUD

fileprivate extension Int {
    static let username = 0
    static let firstName = 1
    static let lastName = 2
}

fileprivate extension User {
    
    static let propertiesCount: Int = {
        var index = 0
        while Self[label: index] != nil {
            index += 1
        }
        return index + 1
    }()
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case .username: return username
            case .firstName: return firstName
            case .lastName: return lastName
            default: return nil
            }
        }
        set {
            switch index {
            case .username:
                username = newValue
            case .firstName:
                firstName = newValue
            case .lastName:
                lastName = newValue
            default:
                break
            }
        }
    }
    
    static subscript(label index: Int) -> String? {
        get {
            switch index {
            case .username: return "Username"
            case .firstName: return "First Name"
            case .lastName: return "Last Name"
            default: return nil
            }
        }
    }
    
}

class LHProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    let getProfileUseCase: AGetMyProfileUseCase = FakeGetMyProfileUseCase(isSuccess: true)
        
    private var user: User? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        ProgressHUD.show()
        getProfileUseCase.getMyProfile{ result in
            switch result {
            case .success(let user):
                ProgressHUD.dismiss()
                self.user = user
                
            case .failure(let error):
                ProgressHUD.showFailed(error.localizedDescription)
            }
        }
        
    }
    

    
    // MARK: - TableView Protocols
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.propertiesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        
        cell.lblCategory.text = User[label: indexPath.row]
        cell.lblName.text = user?[indexPath.row]
        
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
    
    //TO DO: Figure out why it crashed. Has to do with categoriesSetup is a Nil, it shouldn't be. Network connections to get username,firstname,lastname then update cell label with data. Then Do network save when buttons pressed, figure out the error for the save
    
    
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
