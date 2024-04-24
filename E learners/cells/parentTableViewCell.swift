//
//  parentTableViewCell.swift
//  Backup
//
//  Created by qaiser on 05/09/2022.
//

import UIKit

class parentTableViewCell: UITableViewCell {
    @IBOutlet weak var name_lbl:UILabel!
    @IBOutlet weak var relation_lbl:UILabel!
    @IBOutlet weak var phone_no_lbl:UILabel!
    @IBOutlet weak var Buisness_lbl:UILabel!
    @IBOutlet weak var GuardAdressLbl:UILabel!
    @IBOutlet weak var GuardEmailLbl:UILabel!
    @IBOutlet weak var guardian_image:UIImageView!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
