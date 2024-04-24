//
//  TimeLineCell.swift
//  E learners
//
//  Created by Abdul Naffay on 15/10/2023.
//

import UIKit

class TimeLineCell: UITableViewCell {
    @IBOutlet weak var title_lbl:UILabel!
    @IBOutlet weak var date_lbl:UILabel!
    @IBOutlet weak var description_lbl:UILabel!
    @IBOutlet weak var status_View:UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
