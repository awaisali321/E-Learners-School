//
//  StudyMaterial_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 26/10/2023.
//

import UIKit

class StudyMaterials_Cell: UITableViewCell {
    @IBOutlet weak var StudyMaterialHeadingName:UILabel!
    @IBOutlet weak var StudyMaterialDownloadBtn:UIButton!
    @IBOutlet weak var filenameLbl:UILabel!
    @IBOutlet weak var Datelbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
