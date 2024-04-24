//
//  Assignment_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 25/10/2023.
//

import UIKit
import UniformTypeIdentifiers

class Assignment_Cell: UITableViewCell, URLSessionDelegate {
    @IBOutlet weak var assignmentFileName:UILabel!
    @IBOutlet weak var assignmentDownloadBtn:UIButton!
    @IBOutlet weak var filenameLbl:UILabel!
    @IBOutlet weak var Datelbl:UILabel!
    
//    var assignmentsModel:AssignmentModel?
// var url = "https://watim.elearners.com.pk/"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//func savePdf(urlString:String, fileName:String) {
//    DispatchQueue.main.async {
//        let url = URL(string: urlString)
//        let pdfData = try? Data.init(contentsOf: url!)
//        let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
//        let pdfNameFromUrl = "YourAppName-\(fileName).csv"
//        let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
//        do {
//            try pdfData?.write(to: actualPath, options: .atomic)
//            print("File successfully saved!")
//        } catch {
//            print("File could not be saved")
//        }
//    }
//}

