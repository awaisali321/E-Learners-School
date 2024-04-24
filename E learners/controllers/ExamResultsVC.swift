//
//  ExamResultsVC.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit
import Toast_Swift
class ExamResultsVC: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    var ExamModels:Exammination? = nil
    var examResult:ExamResultModel? = nil
    var ExamsNameArray = [String]()
    var ExamsSubjectsNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        ExamResultsApi(self.ExamModels?.examGroupClassBatchExamID ?? "" ,AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tbl.delegate = self
        tbl.dataSource = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
   
    }
    private  func ExamResultsApi( _ exam_group_class_batch_exam_id: String,_ student_id: String) {
        APIServices.ExamResultsApi(exam_group_class_batch_exam_id: exam_group_class_batch_exam_id, student_id: student_id) { (result) in
            switch result{
            case .success(let response):
                
                self.examResult = response
                let data = response.exam
                self.ExamsNameArray.append(response.exam?.exam ?? "")
                self.ExamsSubjectsNameArray.append(response.exam?.subjectResult?.first?.name ?? "")
                self.tbl.reloadData()
                if(response.exam?.subjectResult?.isEmpty == true){
                    self.showToast(message: "No Result Found", font: .systemFont(ofSize: 14.0))
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
extension ExamResultsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExamsNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "ExamResultCell", for: indexPath)as! ExamResultCell
        
        let data = examResult?.exam
        cell.examsName.text = data?.exam
        cell.division_lbl.text = "Division " + "\(data?.division ?? "")"
        cell.grandTotal_lbl.text = "GrandTotal " + "\(data?.totalMaxMarks ?? 0)/" + "\(data?.totalGetMarks ?? 0)"
        cell.percentage_lbl.text = "Percentage " + "\(data?.percentage ?? 0)" + "%"
        cell.result_status_lbl2.text = data?.examResultStatus
        cell.subjectResult = data?.subjectResult
        if(cell.result_status_lbl2.text == "fail"){
            cell.result_status_view2.backgroundColor = UIColor.red
        }else{
            cell.result_status_view2.backgroundColor = UIColor.green
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = examResult?.exam
        let count = data?.subjectResult?.count ?? 0
        let sum = 100 * count
        return CGFloat(80 + sum)
    
    }
}

extension ExamResultsVC {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }
