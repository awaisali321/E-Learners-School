//
//  HomeworkVC2 Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 24/07/2023.
//

import UIKit

class HomeworkVC2_Cell: UITableViewCell {
    @IBOutlet weak var ViewBtn: UIButton!
    @IBOutlet weak var Textlbl: UILabel!
    @IBOutlet weak var StatusView: UIView!
    @IBOutlet weak var Headinglbl: UILabel!
    @IBOutlet weak var Gradelbl: UILabel!
    @IBOutlet weak var Createdbylbl: UILabel!
    @IBOutlet weak var Evaluatedbylbl: UILabel!
    @IBOutlet weak var Evaluationdatelbl: UILabel!
    @IBOutlet weak var Homework_date_lbl: UILabel!
    @IBOutlet weak var HomeWorkSubmission_date_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
