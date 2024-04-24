//
//  TeachersReviewCell.swift
//  E learners
//
//  Created by Abdul Naffay on 31/10/2023.
//

import UIKit

class TeachersReviewCell: UITableViewCell {
    @IBOutlet weak var NameLbl:UILabel!
    @IBOutlet weak var PhoneNumberLbl:UILabel!
    @IBOutlet weak var EmailLbl:UILabel!
    @IBOutlet weak var AddRatingBtn:UIButton!
    @IBOutlet weak var ViewBtn:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
