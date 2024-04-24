//
//  MyDocumentsVC Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class MyDocumentsVC_Cell: UITableViewCell {
    @IBOutlet weak var TitleLbl:UILabel!
    @IBOutlet weak var fileNameLbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
