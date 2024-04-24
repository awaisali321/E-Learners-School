//
//  ExamResultCell.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit

class ExamResultCell: UITableViewCell {
    @IBOutlet weak var examsName:UILabel!
    @IBOutlet weak var grandTotal_lbl:UILabel!
    @IBOutlet weak var percentage_lbl:UILabel!
    @IBOutlet weak var division_lbl:UILabel!
    @IBOutlet weak var result_status_view2:UIView!
    @IBOutlet weak var result_status_lbl2:UILabel!
   
    
    
    @IBOutlet weak var resultTbl:UITableView!
//    var subjectResult:[SubjectsResults]?
    
    var subjectResult:[SubjectsResults]?{
        didSet{
            resultTbl.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resultTbl.dataSource = self
        resultTbl.delegate = self
           resultTbl.reloadData()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ExamResultCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectResult?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTbl.dequeueReusableCell(withIdentifier: "ExamScoreResult_Cell", for: indexPath)as! ExamScoreResult_Cell
        let data = subjectResult?[indexPath.row]
        cell.subjectname_lbl.text = data?.name
        cell.minMarks_lbl.text = data?.minMarks
        cell.marksObtained_lbl.text = "\(data?.getMarks ?? "")/" + "\(data?.maxMarks ?? "")"
        cell.result_status_lbl.text = data?.examGrade
        cell.note_lbl.text = data?.note
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
}
