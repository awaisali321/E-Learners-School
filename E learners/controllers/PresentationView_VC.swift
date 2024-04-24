//
//  PresentationView_VC.swift
//  E learners
//
//  Created by Abdul Naffay on 30/11/2023.
//

import UIKit


class PresentationView_VC: UIViewController {
    @IBOutlet weak var txtView:UITextView!
    var describtionlbl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.text = describtionlbl
       
        // Do any additional setup after loading the view.
    }
    @IBAction func BackBtn(_ sender: Any) {
        self.dismiss(animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
