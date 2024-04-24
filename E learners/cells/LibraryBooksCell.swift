//
//  LibraryBooksCell.swift
//  E learners
//
//  Created by Abdul Naffay on 22/07/2023.
//

import UIKit

class LibraryBooksCell: UITableViewCell {
    @IBOutlet weak var RackNo:UILabel!
    @IBOutlet weak var Price:UILabel!
    @IBOutlet weak var Quantity:UILabel!
    @IBOutlet weak var subject:UILabel!
    @IBOutlet weak var bookname:UILabel!
    @IBOutlet weak var AddedOnDate:UILabel!
    @IBOutlet weak var authorLbl:UILabel!
    @IBOutlet weak var publisherLbl:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
