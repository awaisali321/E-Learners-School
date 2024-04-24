//
//  ExaminationVC2.swift
//  E learners
//
//  Created by Abdul Naffay on 27/08/2023.
//

import UIKit

class ExaminationVC2: UIViewController {
    @IBOutlet weak var tb2:UITableView!
    var ExamModels:[Exammination] = []{
        didSet{
            var getdata: [Exammination] = []
            DispatchQueue.main.async {
                self.tb2.reloadData()
            }
        }
    }
    var Examination_arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ExaminationApi(AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
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
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension ExaminationVC2: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "ExaminationCell2") as! ExaminationCell2
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
}
