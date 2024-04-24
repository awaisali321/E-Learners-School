//
//  FeesCell2.swift
//  E learners
//
//  Created by Abdul Naffay on 27/08/2023.
//

import UIKit

class FeesCell2: UITableViewCell {
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var text_lbl: UILabel!
    @IBOutlet weak var Status_View: UIView!
    @IBOutlet weak var DueDate_View: UIView!
    @IBOutlet weak var heading_lbl: UILabel!
    @IBOutlet weak var fees_code_lbl: UILabel!
    @IBOutlet weak var Due_datew_lbl: UILabel!
    @IBOutlet weak var ammount_lbl: UILabel!
    @IBOutlet weak var Fine_lbl: UILabel!
    @IBOutlet weak var Discount_lbl: UILabel!
    @IBOutlet weak var Paid_AMT_lbl: UILabel!
    @IBOutlet weak var Balance_amt: UILabel!
    @IBOutlet weak var ammount_lbl_2: UILabel!
    @IBOutlet weak var viewbtn:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
