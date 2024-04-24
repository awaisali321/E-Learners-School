//
//  Topic_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 25/10/2023.
//

import UIKit

class Topic_Cell: UITableViewCell {
    @IBOutlet weak var topicnumber:UILabel!
    @IBOutlet weak var topicname:UILabel!
    @IBOutlet weak var topicCompletionLbl:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
