//
//  LessonPlan_Cell.swift
//  E learners
//
//  Created by Abdul Naffay on 20/11/2023.
//

import UIKit

class LessonPlan_Cell: UITableViewCell {
    @IBOutlet weak var LessonPlanDataTbl:UITableView!
    @IBOutlet weak var DaysLbl:UILabel!
    @IBOutlet weak var DatesLbl:UILabel!
    var lessonplanModels:[Days]?{
        didSet{
            LessonPlanDataTbl.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        LessonPlanDataTbl.dataSource = self
        LessonPlanDataTbl.delegate = self
        // Configure the view for the selected state
    }

}
extension LessonPlan_Cell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonplanModels?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LessonPlanDataTbl.dequeueReusableCell(withIdentifier: "LessonPlanData_Cell", for: indexPath)as! LessonPlanData_Cell
        let data = lessonplanModels?[indexPath.row]
        cell.subjectlbl.text = data?.name
        cell.timelbl.text = "\(data?.timeFrom ?? "") - " + "\(data?.timeTo ?? "")"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = lessonplanModels?[indexPath.row]
        appdelegate.lessonplanModels = data
   
        NotificationCenter.default.post(name: Notification.Name("openlessonPlan"), object: data)
        
        
        
    }
}
