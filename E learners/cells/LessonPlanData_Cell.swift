//
//  LessonPlan_Cell_2.swift
//  E learners
//
//  Created by Abdul Naffay on 20/11/2023.
//

import UIKit

class LessonPlanData_Cell: UITableViewCell {
    @IBOutlet weak var subjectlbl:UILabel!
    @IBOutlet weak var timelbl:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
