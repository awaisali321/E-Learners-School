//
//  LogInVC.swift
//  E learners
//
//  Created by qaiser on 31/03/2023.
//

import UIKit

class baseURL_VC: UIViewController {
    @IBOutlet weak var BASE_URLtxt:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SubmitBtn(_ Sender:Any){
        UserDefaults.standard.set(false, forKey: "islogin")
        
    }
    


}
