//
//  onlineCell.swift
//  second project
//
//  Created by qaiser on 18/08/2022.
//

import UIKit

class onlineCell: UITableViewCell {
    @IBOutlet weak var Main_lbl: UILabel!
    @IBOutlet weak var Exam_form_date: UILabel!
    @IBOutlet weak var Exam_form_time: UILabel!
    @IBOutlet weak var total_attempts_lbl: UILabel!
    @IBOutlet weak var duration_lbl: UILabel!
    @IBOutlet weak var Quiz_lbl: UILabel!
    @IBOutlet weak var total_quetions_lbl: UILabel!
    @IBOutlet weak var exam_to_date: UILabel!
    @IBOutlet weak var exam_to_time: UILabel!
    @IBOutlet weak var attempted_lbl: UILabel!
    @IBOutlet weak var status_lbl: UILabel!
    @IBOutlet weak var passing_lbl: UILabel!
    @IBOutlet weak var Discriptive_lbl: UILabel!
    @IBOutlet weak var Questions_lbl: UILabel!
    @IBOutlet weak var lbl15: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
