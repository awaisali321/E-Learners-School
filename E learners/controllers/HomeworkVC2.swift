//
//  HomeworkVC2.swift
//  E learners
//
//  Created by Abdul Naffay on 24/07/2023.
//

import UIKit
import Presentr
class HomeworkVC2: UIViewController {
    @IBOutlet weak var tableview2:UITableView!
    var HomeWorkArray:HomeWorkModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FuncHomeWorkApi(AppDefault.user?.studentID ?? "")
    
    }
    // Do any additional setup after loading the view.
    
    private  func FuncHomeWorkApi( _ student_id: String) {
        APIServices.HomeWorkApi(student_id: student_id) { (result) in
            switch result{
            case .success(let response):
                self.HomeWorkArray = response
                let data = response.homeworklist?.first
                self.tableview2.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    @objc func viewBtn(sender: UIButton){
        let data = HomeWorkArray?.homeworklist?[sender.tag]
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: HomeWorkPOPUP.self)) as? HomeWorkPOPUP else {return}
        vc.tittlelbl = data?.name ?? ""
        vc.describtionlbl = data?.description?.htmlToString ?? ""
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        tableview2.delegate = self
        tableview2.dataSource = self
        // Configure the view for the selected state
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
}
extension HomeworkVC2: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeWorkArray?.homeworklist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "HomeworkVC2_Cell") as! HomeworkVC2_Cell
        let data = HomeWorkArray?.homeworklist?[indexPath.row]
        cell1.Headinglbl.text = data?.name
        cell1.Createdbylbl.text = data?.staffCreated
        cell1.Evaluatedbylbl.text = data?.staffEvaluated
        cell1.Evaluationdatelbl.text = data?.evaluationDate
        cell1.Homework_date_lbl.text = data?.homeworkDate
        cell1.HomeWorkSubmission_date_lbl.text = data?.submitDate
        cell1.Gradelbl.text = "\(data?.homeworklistClass ?? "")" + "\(data?.section ?? "")"
        if (data?.homeworkEvaluationID == "1"){
            cell1.Textlbl.text = "Completed"
            cell1.StatusView.backgroundColor = UIColor.systemGreen
        }else if(data?.homeworkEvaluationID == "0"){
            cell1.Textlbl.text = "InComplete"
            cell1.StatusView.backgroundColor = UIColor.systemRed
        }else{
            
        }
        cell1.ViewBtn.tag = indexPath.row
        cell1.ViewBtn.addTarget(self, action: #selector(viewBtn(sender:)), for: .touchUpInside)
        return cell1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}







