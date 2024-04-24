//
//  DownloadCenterVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit
import Toast_Swift

class DownloadCenterVC: UIViewController {
    @IBOutlet weak var assignment_v: UIView!
    @IBOutlet weak var study_v: UIView!
    @IBOutlet weak var syllabus_v: UIView!
    @IBOutlet weak var viewother2: UIView!
    @IBOutlet weak var AssignmentTbl:UITableView!
    @IBOutlet weak var StudyMterialTbl:UITableView!
    @IBOutlet weak var SyllabusTbl:UITableView!
    @IBOutlet weak var OthersTbl:UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var dashboardmodelArray = appdelegate.dashboardmodelArray
    var assignmentsModel:AssignmentModel?
    var StudyMaterialModel:StudyMterialModel?
    var DowloadaSyllabusModel:DownloadSyllabusModel?
    var DownloadOthersModel:OthersModel1?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignment_v.isHidden = false
        study_v.isHidden = true
        syllabus_v.isHidden = true
        viewother2.isHidden = true
        self.AssignmentsApi("Assignments",dashboardmodelArray?.sectionID ?? "", dashboardmodelArray?.classID ?? "")
  
        // Do any additional setup after loading the view.
    }
    private  func AssignmentsApi(_ tag: String,_ sectionId:String,_ classId:String) {
        APIServices.AssignmentsApi(tag: tag,sectionId:sectionId,classId:classId) {(result) in
            switch result{
            case .success(let response):
                self.assignmentsModel = response
                let data = response.data?.first
                
                self.AssignmentTbl.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
            
        }
    }
    private  func StudyMaterialApi(_ tag: String,_ sectionId:String,_ classId:String) {
        APIServices.StudyMaterialApi(tag: tag,sectionId:sectionId,classId:classId) {(result) in
            switch result{
            case .success(let response):
                self.StudyMaterialModel = response
                let data = response.data?.first
                
                
                self.StudyMterialTbl.reloadData()
            case .failure(let error):
                print(error)
                
            }
            
        }
    }
    private  func DownloadSyllabusApi(_ tag: String,_ sectionId:String,_ classId:String) {
        APIServices.DownloadSyllabusApi(tag: tag,sectionId:sectionId,classId:classId) {(result) in
            switch result{
            case .success(let response):
                self.DowloadaSyllabusModel = response
                let data = response.data?.first
                
                
                
                self.SyllabusTbl.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
            
        }
    }
    
    private  func DownloadOthersApi(_ tag: String,_ sectionId:String,_ classId:String) {
        APIServices.DownloadOthersApi(tag: tag,sectionId:sectionId,classId:classId) {(result) in
            switch result{
            case .success(let response):
                self.DownloadOthersModel = response
                let data = response.data?.first
                
                
                self.OthersTbl.reloadData()
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AssignmentTbl.dataSource = self
        AssignmentTbl.delegate = self
        
        StudyMterialTbl.dataSource = self
        StudyMterialTbl.delegate = self
        
        SyllabusTbl.dataSource = self
        SyllabusTbl.delegate = self
        
        OthersTbl.dataSource = self
        OthersTbl.delegate = self
        
    }
    @objc func AssignmentsDownloadButton(sender: UIButton){
        let data = assignmentsModel?.data?[sender.tag]
        
        let fileURLs : String = "\(appdelegate.imagebaseurl)" + "\(data?.file ?? "")";
        
        
        DispatchQueue.main.async {
            if let url = URL(string: fileURLs) {
                do {
                    let pdfData = try Data(contentsOf: url)
                    
                    let resDocPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
                    
                    // Use the actual file extension from the URL
                    let pdfFileName = UUID().uuidString + (url.pathExtension.isEmpty ? "" : ".\(url.pathExtension)")
                    
                    let filePath = resDocPath.appendingPathComponent(pdfFileName)
                    
                    // Save to Files
                    try pdfData.write(to: filePath, options: .atomic)
                    print("File Saved")
                    self.showToast(message: "File Download Successfully", font: .systemFont(ofSize: 14.0))
                } catch {
                    print("Error downloading or saving file: \(error.localizedDescription)")
                }
            }
        }
        
    }
    @objc func StudyMaterialDownloadButton(sender: UIButton){
        let data = StudyMaterialModel?.data?[sender.tag]
        
        let fileURLs : String = "\(appdelegate.imagebaseurl)" + "\(data?.file ?? "")";
        
        DispatchQueue.main.async {
            if let url = URL(string: fileURLs) {
                do {
                    let pdfData = try Data(contentsOf: url)
                    
                    let resDocPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
                    
                    // Use the actual file extension from the URL
                    let pdfFileName = UUID().uuidString + (url.pathExtension.isEmpty ? "" : ".\(url.pathExtension)")
                    
                    let filePath = resDocPath.appendingPathComponent(pdfFileName)
                    
                    // Save to Files
                    try pdfData.write(to: filePath, options: .atomic)
                    print("File Saved")
                    self.showToast(message: "File Download Successfully", font: .systemFont(ofSize: 14.0))
                } catch {
                    print("Error downloading or saving file: \(error.localizedDescription)")
                }
            }
        }
        
    }
    @objc func SyllabusDownloadButton(sender: UIButton){
        let data = DowloadaSyllabusModel?.data?[sender.tag]
        
        let fileURLs : String = "\(appdelegate.imagebaseurl)" + "\(data?.file ?? "")";
        
        
        DispatchQueue.main.async {
            if let url = URL(string: fileURLs) {
                do {
                    let pdfData = try Data(contentsOf: url)
                    
                    let resDocPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
                    
                    // Use the actual file extension from the URL
                    let pdfFileName = UUID().uuidString + (url.pathExtension.isEmpty ? "" : ".\(url.pathExtension)")
                    
                    let filePath = resDocPath.appendingPathComponent(pdfFileName)
                    
                    // Save to Files
                    try pdfData.write(to: filePath, options: .atomic)
                    print("File Saved")
                    self.showToast(message: "File Download Successfully", font: .systemFont(ofSize: 14.0))
                } catch {
                    print("Error downloading or saving file: \(error.localizedDescription)")
                }
            }
        }
        
    }
    @objc func OthersDownloadButton(sender: UIButton){
        let data = DownloadOthersModel?.data?[sender.tag]
        
        let fileURLs : String = "\(appdelegate.imagebaseurl)" + "\(data?.file ?? "")";
        
        
        DispatchQueue.main.async {
            if let url = URL(string: fileURLs) {
                do {
                    let pdfData = try Data(contentsOf: url)
                    
                    let resDocPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
                    
                    // Use the actual file extension from the URL
                    let pdfFileName = UUID().uuidString + (url.pathExtension.isEmpty ? "" : ".\(url.pathExtension)")
                    
                    let filePath = resDocPath.appendingPathComponent(pdfFileName)
                    
                    // Save to Files
                    try pdfData.write(to: filePath, options: .atomic)
                    print("File Saved")
                    self.showToast(message: "File Download Successfully", font: .systemFont(ofSize: 14.0))
                } catch {
                    print("Error downloading or saving file: \(error.localizedDescription)")
                }
            }
        }
        
    }
 
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            assignment_v.isHidden = false
            study_v.isHidden = true
            syllabus_v.isHidden = true
            viewother2.isHidden = true
            self.AssignmentsApi("Assignments",dashboardmodelArray?.sectionID ?? "", dashboardmodelArray?.classID ?? "")
          
        case 1:
            assignment_v.isHidden = true
            study_v.isHidden = false
            syllabus_v.isHidden = true
            viewother2.isHidden = true
            self.StudyMaterialApi("Study Material",dashboardmodelArray?.sectionID ?? "", dashboardmodelArray?.classID ?? "")
     
        case 2:
            assignment_v.isHidden = true
            study_v.isHidden = true
            syllabus_v.isHidden = false
            viewother2.isHidden = true
            self.DownloadSyllabusApi("Syllabus",dashboardmodelArray?.sectionID ?? "", dashboardmodelArray?.classID ?? "")

        case 3:
            assignment_v.isHidden = true
            study_v.isHidden = true
            syllabus_v.isHidden = true
            viewother2.isHidden = false
            self.DownloadOthersApi("Other Download",dashboardmodelArray?.sectionID ?? "", dashboardmodelArray?.classID ?? "")
            
        default:
            assignment_v.isHidden = false
            self.AssignmentsApi("Assignments",dashboardmodelArray?.sectionID ?? "", dashboardmodelArray?.classID ?? "")
            self.AssignmentTbl.reloadData()
            break;
        }
    }
}



extension DownloadCenterVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == AssignmentTbl){
            return assignmentsModel?.data?.count ?? 0
            
        }else if(tableView == StudyMterialTbl){
            return StudyMaterialModel?.data?.count ?? 0
        }else if(tableView == SyllabusTbl){
            return DowloadaSyllabusModel?.data?.count ?? 0
        }else{
            return DownloadOthersModel?.data?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == AssignmentTbl){
            let cell = AssignmentTbl.dequeueReusableCell(withIdentifier: "Assignment_Cell", for: indexPath)as! Assignment_Cell
            let data = assignmentsModel?.data?[indexPath.row]
            cell.assignmentFileName.text = data?.title
            cell.filenameLbl.text = data?.file
            cell.Datelbl.text = data?.date
            cell.assignmentDownloadBtn.tag = indexPath.row
            cell.assignmentDownloadBtn.addTarget(self, action: #selector(AssignmentsDownloadButton(sender:)), for: .touchUpInside)
            return cell
        }else if(tableView == StudyMterialTbl){
            let cell = StudyMterialTbl.dequeueReusableCell(withIdentifier: "StudyMaterials_Cell", for: indexPath)as! StudyMaterials_Cell
            let data = StudyMaterialModel?.data?[indexPath.row]
            cell.StudyMaterialHeadingName.text = data?.title
            cell.filenameLbl.text = data?.file
            cell.Datelbl.text = data?.date
            cell.StudyMaterialDownloadBtn.tag = indexPath.row
            cell.StudyMaterialDownloadBtn.addTarget(self, action: #selector(StudyMaterialDownloadButton(sender:)), for: .touchUpInside)
            return cell
        }else if(tableView == SyllabusTbl){
            let cell = SyllabusTbl.dequeueReusableCell(withIdentifier: "DownloadCenterSyllabus_Cell", for: indexPath)as! DownloadCenterSyllabus_Cell
            let data = DowloadaSyllabusModel?.data?[indexPath.row]
            cell.SyllabusHeadingName.text = data?.title
            cell.filenameLbl.text = data?.file
            cell.Datelbl.text = data?.date
            cell.SyllabusDownloadBtn.tag = indexPath.row
            cell.SyllabusDownloadBtn.addTarget(self, action: #selector(SyllabusDownloadButton(sender:)), for: .touchUpInside)
            return cell
        }else{
            let cell = OthersTbl.dequeueReusableCell(withIdentifier: "DownloadCOther_Cell", for: indexPath)as! DownloadCOther_Cell
            let data = DownloadOthersModel?.data?[indexPath.row]
            cell.OthersHeadingName.text = data?.title
            cell.filenameLbl.text = data?.file
            cell.DateLbl.text = data?.date
            cell.OtherDownloadBtn.tag = indexPath.row
            cell.OtherDownloadBtn.addTarget(self, action: #selector(OthersDownloadButton(sender:)), for: .touchUpInside)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == AssignmentTbl){
            return 100
        }else if(tableView == StudyMterialTbl){
            return 100
        }else if(tableView == SyllabusTbl){
            return 100
        }else{
            return 100
        }
    }
    
}
extension DownloadCenterVC {
    
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

