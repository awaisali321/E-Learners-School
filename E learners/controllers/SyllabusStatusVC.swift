//
//  SyllabusStatusVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class SyllabusStatusVC: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    
    var SyllabusModel: SyllabusStatusModel?

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.SyllabusStatusApi(AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableview.delegate = self
        tableview.dataSource = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
      
    }
    @objc func LessonTopic(sender: UIButton){
        let data = SyllabusModel?.subjects?[sender.tag]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LessonTopicVC") as? LessonTopicVC
        vc?.subjectGroupSubjectID = data?.subjectGroupSubjectID ?? ""
        vc?.subject_group_class_sections_id = data?.id ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    private  func SyllabusStatusApi(_ student_id: String) {
        APIServices.SyllabusStatusApi(student_id: student_id) {(result) in
            switch result{
            case .success(let response):
                self.SyllabusModel = response
                
                
                
                self.tableview.reloadData()
            case .failure(let error):
                print(error)

            }
        }
    }
}
extension SyllabusStatusVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SyllabusModel?.subjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "SyllabusStatusVC_Cell", for: indexPath)as! SyllabusStatusVC_Cell
        let data = SyllabusModel?.subjects?[indexPath.row]
        if(data?.totalComplete == "1"){
            cell.coursecompletelbl.text = "100% Complete"
        }else{
            cell.coursecompletelbl.text = "0% Complete"
        }
        let stringValue1 = data?.total
        let stringValue2 = data?.totalComplete
        if let numerator = Int( stringValue1 ?? ""), let denominator = Int(stringValue2 ?? "") {
            // Perform the percentage calculation
//            let percentage = (denominator / 100) * numerator
            let percentage = (numerator / 100) * denominator
            cell.coursecompletelbl.text = "\(percentage)% Completed"
            
        } else {
            print("Invalid numeric values")
        }

        cell.headinglbl.text = data?.subjectName
        cell.LessonTopicBtn.tag = indexPath.row
        cell.LessonTopicBtn.addTarget(self, action: #selector(LessonTopic(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
