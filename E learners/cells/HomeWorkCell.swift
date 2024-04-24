//
//  feeeeesTableViewCell.swift
//  Backup
//
//  Created by qaiser on 20/08/2022.
//

import UIKit

class HomeWorkCell: UITableViewCell {
    @IBOutlet weak var ViewBtn: UIButton!
    @IBOutlet weak var UploadHomeWorkBtn:UIButton!
    @IBOutlet weak var text_lbl: UILabel!
    @IBOutlet weak var Status_View: UIView!
    @IBOutlet weak var heading_lbl: UILabel!
    @IBOutlet weak var Grade_lbl: UILabel!
    @IBOutlet weak var Created_by_lbl: UILabel!
    @IBOutlet weak var Evaluated_by_lbl: UILabel!
    @IBOutlet weak var Evaluation_date_lbl: UILabel!
    @IBOutlet weak var Homework_date_lbl: UILabel!
    @IBOutlet weak var HomeWorkSubmission_date_lbl: UILabel!
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
