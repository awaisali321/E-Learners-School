//
//  CHILD_LIST_CELL.swift
//  E learners
//
//  Created by zain on 28/09/2023.
//

import UIKit

class Fees_detail_Cell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var fine: UILabel!
    @IBOutlet weak var paid: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
