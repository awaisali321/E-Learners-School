//
//  NotificationVC.swift
//  E learners
//
//  Created by Abdul Naffay on 22/07/2023.
//

import UIKit

class NotificationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
      
    }

}
