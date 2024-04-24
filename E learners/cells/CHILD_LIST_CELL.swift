//
//  CHILD_LIST_CELL.swift
//  E learners
//
//  Created by zain on 28/09/2023.
//

import UIKit

class CHILD_LIST_CELL: UITableViewCell {
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var section_lbl: UILabel!
    @IBOutlet weak var image_user: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
