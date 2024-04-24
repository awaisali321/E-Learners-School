//
//  ApplyLeaveVC.swift
//  E learners
//
//  Created by Abdul Naffay on 24/07/2023.
//

import UIKit
import Presentr
class ApplyLeaveVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
      
    }
    @IBAction func Addbtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ApplyLeaveDocuments_VC") as? ApplyLeaveDocuments_VC
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
