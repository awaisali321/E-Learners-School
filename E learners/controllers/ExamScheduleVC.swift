//
//  ExamScheduleVC.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit

class ExamScheduleVC: UIViewController {
    @IBOutlet weak var table:UITableView!
    var ExamModels:Exammination? = nil
    var examSchedule:ExamScheduleModel? {
        didSet{
            table.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExamScheduleApi(self.ExamModels?.examGroupClassBatchExamID ?? "")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        table.delegate = self
        table.dataSource = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    private  func ExamScheduleApi( _ exam_group_class_batch_exam_id: String) {
        APIServices.ExamScheduleApi(exam_group_class_batch_exam_id: exam_group_class_batch_exam_id) { (result) in
            switch result{
            case .success(let response):
                
                self.examSchedule = response
                let data = response.examSubjects
     
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
extension ExamScheduleVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examSchedule?.examSubjects?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "ExamScheduleCell", for: indexPath)as! ExamScheduleCell
        let data = examSchedule?.examSubjects?[indexPath.row]
        cell.examnamelbl.text = data?.subjectName
        cell.datelbl.text = data?.dateFrom
        cell.roomNolbl.text = data?.roomNo
        cell.Starttimelbl.text = data?.timeFrom
        cell.durationlbl.text = data?.duration
        cell.maxmarkslbl.text = data?.maxMarks
        cell.minmarkslbl.text = data?.minMarks
        cell.credithouslbl.text = data?.creditHours
        return cell
 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
