//
//  LogInVC.swift
//  E learners
//
//  Created by qaiser on 31/03/2023.
//

import UIKit
import Toast_Swift
import RappleProgressHUD
import Presentr

class LogInVC: UIViewController {
    @IBOutlet weak var usertxt:UITextField!
    @IBOutlet weak var passtxt:UITextField!
    @IBOutlet weak var btn1:UIButton!
    @IBOutlet weak var eyebtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usertxt.text = "std007"
        passtxt.text = "007"
        // Do any additional setup after loading the view.
    }
    var modelLogin: Userdata? {
        didSet {
            if modelLogin?.token != "" {
                
                UserDefaults.standard.set(self.modelLogin?.token ?? "", forKey: "token")
                
            }
        }
    }

    @IBAction func loginBtn(_ Sender:Any){
        if usertxt.text != "" {
            if passtxt.text != "" {
                UserDefaults.standard.set(true, forKey: "islogin")
                UserDefaults.standard.set(usertxt.text, forKey: "username")
                UserDefaults.standard.set(passtxt.text, forKey: "password")
                funLogin(usertxt.text!, passtxt.text!)
            }
        }
    }
    
    func showchildList(data:Userdata){
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: CHILD_LIST.self)) as? CHILD_LIST else {return}
        vc.modelLogin = data
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
  
    }
    
    @IBAction func eyebtn(_ Sender:UIButton){
        eyebtn.isSelected = !eyebtn.isSelected
        if eyebtn.isSelected{
            passtxt.isSecureTextEntry = false
        }else{
            passtxt.isSecureTextEntry = true
        }
    }
    
    @IBAction func ForgetBtn(_ Sender:Any){
        
    }
    @IBAction func privaceyBtn(_ Sender:Any){
        
    }
    @IBAction func worldBtn(_ Sender:Any){
        guard let url = URL(string: "https://watim.elearners.com.pk") else { return }
        UIApplication.shared.open(url)
    }
 
    private  func funLogin(_ email: String, _ password: String) {
        APIServices.login(email: email, password: password) {(result) in
            switch result{
            case .success(let response):
                if(response.role == "parent"){
                    self.showchildList(data: response)
                }else{
                    appdelegate.GotoDashBoard()
                }

            case .failure(let error):
                print(error)
                
            }
        }
    }
}
