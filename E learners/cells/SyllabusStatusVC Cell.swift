//
//  SyllabusStatusVC Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class SyllabusStatusVC_Cell: UITableViewCell {
    @IBOutlet weak var headinglbl:UILabel!
    @IBOutlet weak var coursecompletelbl:UILabel!
    @IBOutlet weak var LessonTopicBtn:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
