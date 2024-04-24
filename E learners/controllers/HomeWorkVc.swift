//
//  feesViewController.swift
//  Backup
//
//  Created by qaiser on 20/08/2022.
//

import UIKit
import Presentr

class HomeWorkVc: UIViewController {
    @IBOutlet weak var tb2:UITableView!
    var HomeWorkArray:HomeWorkModel? {
        didSet{
            tb2.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.FuncHomeWorkApi(AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
    }
    
    private  func FuncHomeWorkApi( _ student_id: String) {
        APIServices.HomeWorkApi(student_id: student_id) { (result) in
            switch result{
            case .success(let response):
                self.HomeWorkArray = response
                let data = response.homeworklist?.first
                self.tb2.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        // Configure the view for the selected state
    }
    @IBAction func sidemenu(_ sender: Any) {
        self.sideMenuController?.toggle()
    }
    @IBAction func Notificationbtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationVC") as? NotificationVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
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
    @objc func UploadHomeWorkBtn(sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "UploadHomeworkVC") as! UploadHomeworkVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension HomeWorkVc: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeWorkArray?.homeworklist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "HomeWorkCell") as! HomeWorkCell
        let data = HomeWorkArray?.homeworklist?[indexPath.row]
        cell1.heading_lbl.text = data?.name
        cell1.Created_by_lbl.text = data?.staffCreated
        cell1.Evaluated_by_lbl.text = data?.staffEvaluated
        cell1.Evaluation_date_lbl.text = data?.evaluationDate
        cell1.Homework_date_lbl.text = data?.homeworkDate
        cell1.HomeWorkSubmission_date_lbl.text = data?.submitDate
        if (data?.homeworkEvaluationID == "1"){
            cell1.text_lbl.text = "Completed"
            cell1.Status_View.backgroundColor = UIColor.systemGreen
        }else if(data?.homeworkEvaluationID == "0"){
            cell1.text_lbl.text = "InComplete"
            cell1.Status_View.backgroundColor = UIColor.systemRed
        }else{
            
        }
        cell1.Grade_lbl.text = "\(data?.homeworklistClass ?? "")" + "\(data?.section ?? "")"
        cell1.ViewBtn.tag = indexPath.row
        cell1.ViewBtn.addTarget(self, action: #selector(viewBtn(sender:)), for: .touchUpInside)
        cell1.UploadHomeWorkBtn.tag = indexPath.row
        cell1.UploadHomeWorkBtn.addTarget(self, action: #selector(UploadHomeWorkBtn(sender:)), for: .touchUpInside)
        return cell1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

