//
//  TimelineVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class TimelineVC: UIViewController {
    @IBOutlet weak var timelinetbl:UITableView!
    
    var TimeLine:[TimelineModel]?{
        didSet{
            timelinetbl.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TimeLineApi(AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        timelinetbl.dataSource = self
        timelinetbl.delegate = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    private  func TimeLineApi(_ student_id: String) {
        APIServices.TimeLineApi(student_id: student_id) {(result) in
            switch result{
            case .success(let response):
                self.TimeLine = [response]
                
                
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
    
}
extension TimelineVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimeLine?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = TimeLine?[indexPath.row]
        let cell = timelinetbl.dequeueReusableCell(withIdentifier: "TimeLineCell", for: indexPath)as! TimeLineCell
        cell.date_lbl.text = data?.first?.timelineDate
        cell.title_lbl.text = data?.first?.title
        cell.description_lbl.text = data?.first?.description
        
        if(data?.first?.status == "yes"){
            if #available(iOS 15.0, *) {
                cell.status_View.backgroundColor = UIColor.systemCyan
            } else {
                // Fallback on earlier versions
            }
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
