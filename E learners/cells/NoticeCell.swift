//
//  examTableViewCell.swift
//  second project
//
//  Created by qaiser on 18/08/2022.
//

import UIKit

class NoticeCell: UITableViewCell {
    @IBOutlet weak var heading_lbl: UILabel!
    @IBOutlet weak var Date_lbl: UILabel!
    @IBOutlet weak var Viewbtn:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
