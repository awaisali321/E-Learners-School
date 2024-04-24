//
//  examTableViewCell.swift
//  second project
//
//  Created by qaiser on 18/08/2022.
//

import UIKit

class Exam_infoCell: UITableViewCell {
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var Examresults: UIButton!
    @IBOutlet weak var ExamsSchedule: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
