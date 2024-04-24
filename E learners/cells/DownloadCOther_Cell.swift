//
//  DownloadCOther_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 26/10/2023.
//

import UIKit

class DownloadCOther_Cell: UITableViewCell {
    @IBOutlet weak var OthersHeadingName:UILabel!
    @IBOutlet weak var OtherDownloadBtn:UIButton!
    @IBOutlet weak var filenameLbl:UILabel!
    @IBOutlet weak var DateLbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
