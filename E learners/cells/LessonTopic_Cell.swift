//
//  LessonTopic_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 19/10/2023.
//

import UIKit

class LessonTopic_Cell: UITableViewCell {
    @IBOutlet weak var SubjectNumber1Lbl:UILabel!
    @IBOutlet weak var SubjectName1lbl:UILabel!
    @IBOutlet weak var CourseCompleteion1Lbl:UILabel!
    @IBOutlet weak var TopicTbl:UITableView!
 

    var topicsarray:[Topics]?{
        didSet{
            TopicTbl.reloadData()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        TopicTbl.dataSource = self
        TopicTbl.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension LessonTopic_Cell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsarray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TopicTbl.dequeueReusableCell(withIdentifier: "Topic_Cell", for: indexPath)as! Topic_Cell
        let data = topicsarray?[indexPath.row]
        cell.topicname.text = data?.name
        if(data?.status == "1"){
            cell.topicCompletionLbl.text = "100% Complete"
        }else{
            cell.topicCompletionLbl.text = "InComplete"
        }
        cell.topicnumber.text = data?.status
        if(data?.completeDate == "0000-00-00"){
            cell.topicCompletionLbl.text = "InComplete"
        }else{
            cell.topicCompletionLbl.text = "Complete(" + "\(data?.completeDate ?? ""))"
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
