//
//  online.swift
//  second project
//
//  Created by qaiser on 18/08/2022.
//

import UIKit

class online_exam_VC: UIViewController {
    @IBOutlet weak var tb2:UITableView!
    var examresultarray:Onlineexamresultmodel?{
        didSet{
            self.tb2.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onlineexamresultapi(AppDefault.user?.studentID ?? "","83")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        
        
     
    }
    private  func onlineexamresultapi( _ onlineexam_student_id: String,_ exam_id:String) {
        APIServices.onlineresultexamApi(onlineexam_student_id: onlineexam_student_id, exam_id: exam_id) { (result) in
            switch result{
            case .success(let response):
                self.examresultarray = response
                let data = response.result?.exam
                
                
          
            case .failure(let error):
                print(error)
               
            }
          
        }
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension online_exam_VC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb2.dequeueReusableCell(withIdentifier: "onlineCell", for: indexPath)as! onlineCell
        let data = examresultarray?.result?.exam
        cell.Exam_form_date.text = data?.examFrom
        cell.Exam_form_time.text = data?.timeFrom
        cell.exam_to_date.text = data?.examTo
        cell.exam_to_time.text = data?.timeTo
        cell.total_attempts_lbl.text = data?.attempt
        cell.attempted_lbl.text = data?.attempt
        cell.duration_lbl.text = data?.duration
        cell.status_lbl.text = data?.publishResult
        cell.Quiz_lbl.text = data?.isQuiz
        cell.passing_lbl.text = "\(data?.passingPercentage ?? "")" + "(%)"
        cell.total_quetions_lbl.text = "\(data?.totalQuestion ?? 0)"
        cell.Discriptive_lbl.text = "\(data?.totalDescriptive ?? 0)"
        cell.Main_lbl.text = data?.exam
  
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
 
    
    
    
}
