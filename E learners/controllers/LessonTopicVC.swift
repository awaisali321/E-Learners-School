//
//  LessonTopicVC.swift
//  E learners
//
//  Created by Abdul Naffay on 28/07/2023.
//

import UIKit
import Toast_Swift
class LessonTopicVC: UIViewController {
 
    var subjectGroupSubjectID = String()
    var subject_group_class_sections_id = String()
    var subjectname = String()
    var topicModel:[LessontopicModelElement]? {
        didSet{
            lessontopicTbl.reloadData()
        }
    }
    @IBOutlet weak var lessontopicTbl:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lessontopicApi(subjectGroupSubjectID, subject_group_class_sections_id)
       
        // Do any additional setup after loading the view.
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        lessontopicTbl.dataSource = self
        lessontopicTbl.delegate = self
    }
    
    private  func lessontopicApi(_ subject_group_subject_id: String,_ subject_group_class_sections_id:String) {
        APIServices.lessontopicApi(subject_group_subject_id: subject_group_subject_id,subject_group_class_sections_id:subject_group_class_sections_id) {(result) in
            switch result{
            case .success(let response):
                self.topicModel = response
                let data = response.first
                if (response.isEmpty == true){
                    self.showToast(message: "No Data Found", font: .systemFont(ofSize: 14.0))
                }
    
            case .failure(let error):
                print(error)
                
            }
            
        }
    }
}
extension LessonTopicVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicModel?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = lessontopicTbl.dequeueReusableCell(withIdentifier: "LessonTopic_Cell", for: indexPath)as! LessonTopic_Cell
        
        let data = topicModel?[indexPath.row]
        cell.SubjectName1lbl.text = data?.name
        cell.topicsarray = data?.topics
        let stringValue1 = data?.total
        let stringValue2 = data?.totalComplete
        if let numerator = Int( stringValue2 ?? ""), let denominator = Int(stringValue1 ?? "") {
            // Perform the percentage calculation
            let percentage = (numerator * 100) / denominator
            cell.CourseCompleteion1Lbl.text = "\(percentage)% Completed"
            
        } else {
            print("Invalid numeric values")
        }
        return cell
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let data = topicModel?[indexPath.row]
            let count = data?.topics?.count ?? 0
            let sum = 50 * count
            return CGFloat(80 + sum)
            
        }
        
    }

extension LessonTopicVC {
    
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
