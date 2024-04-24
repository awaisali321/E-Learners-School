//
//  LessonPlanVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class LessonPlanVC: UIViewController {
    @IBOutlet weak var LessonPlanTbl:UITableView!
    @IBOutlet weak var DatesLbl:UILabel!
    var daysArry = [String]()
    var tableViewController: LessonPlanVC?
    var LessonPlanModel:LessonPlanWeeklyModel?{
        didSet{
            self.daysArry = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
            LessonPlanTbl.reloadData()
        }
    }
    var dates: [Date] = []
//    var dates = [Date(), Date(), Date(), Date(), Date()]
    var DaysArray:[[Days]]?{
        didSet{
            LessonPlanTbl.reloadData()
        }
    }
    var currentDate = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("openlessonPlan"), object: nil)
        self.LessonPlanWeeklyApi("2023-12-10", AppDefault.user?.studentID ?? "", "2023-12-04")
    
        for day in 0..<5 {
                  if let date = Calendar.current.date(byAdding: .day, value: 4, to: currentDate) {
                      dates.append(date)
                  }
              }
    }
   

   @objc func methodOfReceivedNotification(notification: NSNotification){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Presentation_VC") as! Presentation_VC
       secondViewController.lessonplanModels = appdelegate.lessonplanModels
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        LessonPlanTbl.dataSource = self
        LessonPlanTbl.delegate = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func NextDaysBtn(_ sender: Any) {
       
        self.nextButtonPressed2()
        LessonPlanTbl.reloadData()
    }
    func updateDateLabel() {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd/MM/yyyy"
         let nextWeekDate = Calendar.current.date(byAdding: .weekday, value: 4, to: currentDate)!

         let dateString = "\(dateFormatter.string(from: currentDate)) - \(dateFormatter.string(from: nextWeekDate))"
        DatesLbl.text = dateString
//        let vc = LessonPlan_Cell()
//        vc.DatesLbl.text = dateString
//        vc.LessonPlanDataTbl.reloadData()
        
     }
    @objc func nextButtonPressed2() {
            currentDate = Calendar.current.date(byAdding: .weekday, value: 4, to: currentDate)!
            updateDateLabel()
//        LessonPlanTbl.reloadData()
        LessonPlanTbl.reloadData()
        }
    @objc func PreviousPressed2() {
            currentDate = Calendar.current.date(byAdding: .weekday, value: -4, to: currentDate)!
            updateDateLabel()
//        LessonPlanTbl.reloadData()
        LessonPlanTbl.reloadData()
        }
    @IBAction func PreviousDaysBtn(_ sender: Any) {
        self.PreviousPressed2()
        LessonPlanTbl.reloadData()
        
    }

    private  func LessonPlanWeeklyApi(_ date_to: String,_ student_id:String,_ date_from:String) {
        APIServices.LessonPlanWeeklyApi(date_to: date_to,student_id:student_id,date_from:date_from) {(result) in
            switch result{
            case .success(let response):
                self.LessonPlanModel = response
   
                
            case .failure(let error):
                print(error)

            }
        }
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
extension LessonPlanVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LessonPlanTbl.dequeueReusableCell(withIdentifier: "LessonPlan_Cell", for: indexPath)as! LessonPlan_Cell

        let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "dd/MM/yyyy"
             let dateString = dateFormatter.string(from: dates[indexPath.row])
        cell.DatesLbl.text = dateString
  
        
        
        
        let data = daysArry[indexPath.row]
        cell.DaysLbl.text = data
        
        if indexPath.row == 0{
            cell.lessonplanModels = self.LessonPlanModel?.timetable?.monday
        }
        if indexPath.row == 1{
            cell.lessonplanModels = self.LessonPlanModel?.timetable?.tuesday
        }
        if indexPath.row == 2{
            cell.lessonplanModels = self.LessonPlanModel?.timetable?.wednesday
        }
        if indexPath.row == 3{
            cell.lessonplanModels = self.LessonPlanModel?.timetable?.thursday
        }
        if indexPath.row == 4{
            cell.lessonplanModels = self.LessonPlanModel?.timetable?.friday
        }
        
        
        
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data =  daysArry[indexPath.row]
        var count = Int()
        var sum = Int()
        
        
        if(indexPath.row == 0){
            if self.LessonPlanModel?.timetable?.monday?.count ?? 0 > 0{
                count =  self.LessonPlanModel?.timetable?.monday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 1){
            if self.LessonPlanModel?.timetable?.tuesday?.count ?? 0 > 0{
                count =  self.LessonPlanModel?.timetable?.tuesday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 2){
            if self.LessonPlanModel?.timetable?.wednesday?.count ?? 0 > 0{
                count =  self.LessonPlanModel?.timetable?.wednesday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 3){
            if self.LessonPlanModel?.timetable?.thursday?.count ?? 0 > 0{
                count =  self.LessonPlanModel?.timetable?.thursday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 4){
            if self.LessonPlanModel?.timetable?.friday?.count ?? 0 > 0{
                count =  self.LessonPlanModel?.timetable?.friday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
      
        
       
        if(sum == 0){
            return 125
        }else{
            return CGFloat(80 + sum)
        }
      
        
        
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
