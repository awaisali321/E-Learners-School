//
//  HomeWorkPOPUP.swift
//  E learners
//
//  Created by Abdul Naffay on 30/09/2023.
//

import UIKit

class HomeWorkPOPUP: UIViewController {
    @IBOutlet weak var HomeWorkDescriptionLBL:UILabel!
    @IBOutlet weak var HomeWorkDescriptionTextView:UITextView!
    var tittlelbl = String()
    var describtionlbl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeWorkDescriptionLBL.text = tittlelbl
        HomeWorkDescriptionTextView.text = describtionlbl
        // Do any additional setup after loading the view.
    }
   
    @IBAction func PopupCloseBtn(_ sender:Any){
        self.dismiss(animated: true)
    }
}
