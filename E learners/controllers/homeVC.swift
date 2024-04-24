//
//  homeViewController.swift
//  second project
//
//  Created by qaiser on 19/08/2022.
//

import UIKit
import FSCalendar
import AVFoundation

class homeVC: UIViewController,FSCalendarDelegate,FSCalendarDataSource{
    var dashboardmodelArray:DashbaordModel? = nil
    @IBOutlet weak var Attandacnce: UILabel!
    @IBOutlet weak var homework: UILabel!
    @IBOutlet weak var pending: UILabel!
    @IBOutlet weak var monthlbl: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var CalanderVIEW: UIView!
    @IBOutlet weak var Calender:FSCalendar!
    @IBOutlet weak var menubtn:UIButton!
    var siderbar = [String]()
    var imageARR = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        let dateFormatter = DateFormatter()
        let MonthFormat = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        MonthFormat.dateFormat = "EEEE"
        
        Calender.delegate = self
        Calender.dataSource = self
        
        // Request camera and microphone permissions
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                // Permission granted, you can use the camera
            } else {
                // Permission denied, handle the denial
            }
        }
        
        self.funcDashboard("2023-11-31", AppDefault.user?.studentID ?? "", AppDefault.user?.role ?? "", "2023-10-01")
        siderbar = ["Home","Profile","Fees","Time Table","Lesson Plan","Syllabus Status",
                    "Home Work","Online Exam","Apply Leave","Download Center","Attendence", "Examination","Notice Board","Timeline","My Documents","Teachers Review","Librarey","Transport Route","Hostels","About School","Log Out"]
        imageARR = ["home_icon.png","ic_profile_plus.png","ic_nav_fees.png","ic_calender_cross.png","ic_clipboard_filled.png","ic_dashboard_pandingtask.png","homework2.png","wifi.png","ic_calender_cross.png","download.png","ic_nav_attendance.png","ic_nav_reportcard.png","ic_email_filled.png","ic_nav_timeline.png","ic_documents_certificate.png","ic_teacher.png","ic_nav_library.png","ic_nav_transport.png","ic_nav_hostel.png","ic_nav_about.png","Transport"]
        
        self.setupUi()
    }
    
    func setupUi(){
        view1.addTopShadow(shadowColor: UIColor.gray, shadowOpacity: 0.5, shadowRadius: 3, offset: CGSize(width: 0.0, height : 1.0))
        view1.addTopShadow(shadowColor: UIColor.gray, shadowOpacity: 0.5, shadowRadius: 3, offset: CGSize(width: 0.0, height : 1.0))

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func menubtn(_ sender: UIButton){
        self.sideMenuController?.toggle()
    }
    
    @IBAction func attendance(_ sender: Any){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AttendanceVC") as? AttendanceVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func pendingtask(_ sender: Any){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyPendingTask") as? MyPendingTask
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func homework(_ sender: Any){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeworkVC2") as? HomeworkVC2
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func Notificationbtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationVC") as? NotificationVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func PreviousMonthBtn(_ sender: Any) {
        Calender.setCurrentPage(getPreviousMonth(date: Calender.currentPage), animated: true)
        self.monthlbl.text = getPreviousMonth(date: Calender.currentPage).getFormattedDate(format: "MMMM")
        //        self.monthlbl.text = getPreviousMonth(date: Calender.currentPage).pToString()
        
    }
    
    @IBAction func NextMonthBtn(_ sender: Any) {
        Calender.setCurrentPage(getNextMonth(date: Calender.currentPage), animated: true)
        self.monthlbl.text = getNextMonth(date: Calender.currentPage).getFormattedDate(format: "MMMM")
        //        self.monthlbl.text = getNextMonth(date: Calender.currentPage).pToString()
    }
    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to:date)!
    }
    
    func getPreviousMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to:date)!
        
    }
    
    private  func funcDashboard(_ date_to: String, _ student_id: String, _ role: String, _ date_from: String) {
        APIServices.dashobard(date_to: date_to, student_id: student_id,rolename: role, date_from: date_from) { (result) in
            switch result{
            case .success(let response):
                appdelegate.dashboardmodelArray = response
                self.Attandacnce.text = "\(response.studentAttendencePercentage ?? 0)"+"%"
                self.homework.text = "\(response.studentHomeworkIncomplete ?? 0)"
                self.pending.text = "\(response.studentIncompleteTask ?? 0)"
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

extension UIView {
    func addTopShadow(shadowColor : UIColor, shadowOpacity : Float,shadowRadius : Float,offset:CGSize){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = CGFloat(shadowRadius)
        //        self.layer.cornerRadius = 20
        self.clipsToBounds = false
    }
}


