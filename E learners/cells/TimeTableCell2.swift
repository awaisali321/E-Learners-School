//
//  TimeTableCell2.swift
//  E learners
//
//  Created by Abdul Naffay on 12/10/2023.
//

import UIKit

class TimeTableCell2: UITableViewCell {
    @IBOutlet weak var timelbl:UILabel!
    @IBOutlet weak var subjectlbl:UILabel!
    @IBOutlet weak var RoomNolbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
