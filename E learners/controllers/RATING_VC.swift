//
//  RATING_VC.swift
//  E learners
//
//  Created by zain on 28/09/2023.
//

import UIKit

class RATING_VC: UIViewController {
 
    @IBOutlet weak var CosMosView: UIView!
    @IBOutlet weak var text_comment: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(sender : Any){
        self.dismiss(animated: true)
    }
    
    @IBAction func submit(sender : Any){
     
    }
}
