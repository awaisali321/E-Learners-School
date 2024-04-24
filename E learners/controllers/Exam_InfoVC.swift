//
//  exam_infoViewController.swift
//  second project
//
//  Created by qaiser on 18/08/2022.
//

import UIKit

class Exam_InfoVC: UIViewController {
    @IBOutlet weak var tb2:UITableView!
    var Examination_arr = [String]()
    var ExamModels:[Exammination] = []{
        didSet{
            var getdata: [Exammination] = []
            DispatchQueue.main.async {
                self.tb2.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ExaminationApi(AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
       
    }
    
    
    private  func ExaminationApi(_ student_id: String) {
        APIServices.ExaminationApi(student_id: student_id) {(result) in
            switch result{
            case .success(let response):
                self.ExamModels = response
                
            case .failure(let error):
                print(error)
                
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        
    }

    @objc func examresult(sender: UIButton){
        let data = ExamModels[sender.tag]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ExamResultsVC") as? ExamResultsVC
        vc?.ExamModels = data
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @objc func examschedule(sender: UIButton){
        let data = ExamModels[sender.tag]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ExamScheduleVC") as? ExamScheduleVC
        vc?.ExamModels = data
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func sidemenu(_ sender: Any) {
        self.sideMenuController?.toggle()
    }
}
extension Exam_InfoVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tb2.dequeueReusableCell(withIdentifier: "Exam_infoCell") as! Exam_infoCell
        let data = ExamModels[indexPath.row]
        cell1.lbl1.text = data.exam
        cell1.Examresults.tag = indexPath.row
        cell1.ExamsSchedule.tag = indexPath.row
        cell1.Examresults.addTarget(self, action: #selector(examresult(sender:)), for: .touchUpInside)
        cell1.ExamsSchedule.addTarget(self, action: #selector(examschedule(sender:)), for: .touchUpInside)
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection Section: Int) -> Int{
        return ExamModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 110
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
