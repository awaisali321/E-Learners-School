//
//  ExamScoreResult_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 20/10/2023.
//

import UIKit

class ExamScoreResult_Cell: UITableViewCell {
    @IBOutlet weak var subjectname_lbl:UILabel!
    @IBOutlet weak var minMarks_lbl:UILabel!
    @IBOutlet weak var marksObtained_lbl:UILabel!
    @IBOutlet weak var result_status_lbl:UILabel!
    @IBOutlet weak var result_status_view:UIView!
    @IBOutlet weak var note_lbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
