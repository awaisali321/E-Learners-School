//
//  ExamScheduleCell.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit

class ExamScheduleCell: UITableViewCell {
    @IBOutlet weak var examnamelbl:UILabel!
    @IBOutlet weak var datelbl:UILabel!
    @IBOutlet weak var roomNolbl:UILabel!
    @IBOutlet weak var Starttimelbl:UILabel!
    @IBOutlet weak var durationlbl:UILabel!
    @IBOutlet weak var maxmarkslbl:UILabel!
    @IBOutlet weak var minmarkslbl:UILabel!
    @IBOutlet weak var credithouslbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
