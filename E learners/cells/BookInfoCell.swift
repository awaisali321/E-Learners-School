//
//  bookinfoTableViewCell.swift
//  Backup
//
//  Created by qaiser on 20/08/2022.
//

import UIKit

class BookInfoCell: UITableViewCell {
    @IBOutlet weak var status_view: UIView!
    @IBOutlet weak var status_lbl: UILabel!
    @IBOutlet weak var book_name_lbl: UILabel!
    @IBOutlet weak var issue_date_lbl: UILabel!
    @IBOutlet weak var retuurn_date_lbl: UILabel!
    @IBOutlet weak var Book_no_lbl: UILabel!
    @IBOutlet weak var Due_date_lbl: UILabel!
    @IBOutlet weak var book_writer_lbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
     
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
