//
//  HostelPopup_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 15/10/2023.
//

import UIKit

class HostelPopup_Cell: UITableViewCell {
    @IBOutlet weak var RoomType_lbl:UILabel!
    @IBOutlet weak var NumberOfBed_lbl:UILabel!
    @IBOutlet weak var RoomNo_lbl:UILabel!
    @IBOutlet weak var RoomCost_lbl:UILabel!
    @IBOutlet weak var ViewBtn111:UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
