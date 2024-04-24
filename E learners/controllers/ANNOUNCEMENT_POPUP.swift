//
//  ANNOUNCEMENT_POPUP.swift
//  E learners
//
//  Created by zain on 28/09/2023.
//

import UIKit

class ANNOUNCEMENT_POPUP: UIViewController {
    @IBOutlet weak var top_lbl:UILabel!
    @IBOutlet weak var text_view:UITextView!
    var tittlelbl = String()
    var describtionlbl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        top_lbl.text = tittlelbl
        text_view.text = describtionlbl
        // Do any additional setup after loading the view.
    }
        @IBAction func btnBack(sender:Any){
            self.dismiss(animated: true)
            
        }
    }

