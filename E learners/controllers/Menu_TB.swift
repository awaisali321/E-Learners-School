//
//  Menu_TB.swift
//  E learners
//
//  Created by qaiser on 10/04/2023.
//

import UIKit

class Menu_TB: UITabBarController {
    let kMainStoryBoard             =   UIStoryboard(name: "Main", bundle: nil)
var iscome = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(iscome == "Home"){
            self.selectedIndex = 0
        }
        else if(iscome == "Homework"){
            self.selectedIndex = 1
            
        }
        else if(iscome == "Examination"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "ExaminationVC2") as? ExaminationVC2
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        else if(iscome == "timetable"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "TimeTable_VC") as? TimeTable_VC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Profile"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }

        else if(iscome == "About College"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "AboutSchoolVC") as? AboutSchoolVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Apply Leave"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "ApplyLeaveVC") as? ApplyLeaveVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Syllabus Status"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "SyllabusStatusVC") as? SyllabusStatusVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "My Documents"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "MyDocumentsVC") as? MyDocumentsVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Transport Route"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "TransportRouteVC") as? TransportRouteVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Attendance"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "AttendanceVC") as? AttendanceVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Hostels"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "HostelsVC") as? HostelsVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Timeline"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "TimelineVC") as? TimelineVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        else if(iscome == "Teachers Review"){
        iscome = ""
        let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "TeacherReviewVC") as? TeacherReviewVC
        self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Download Center"){
            iscome = ""
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "DownloadCenterVC") as? DownloadCenterVC
            self.navigationController?.pushViewController(myViewController!, animated: true)
        }
        
        else if(iscome == "Lesson Plan"){
        iscome = ""
        let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "LessonPlanVC") as? LessonPlanVC
        self.navigationController?.pushViewController(myViewController!, animated: true)
    }
        
        else if(iscome == "Home Work"){
        iscome = ""
        let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "HomeworkVC2") as? HomeworkVC2
        self.navigationController?.pushViewController(myViewController!, animated: true)
    }
        
        else if(iscome == "Fees"){
        iscome = ""
        let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "FeesVC2") as? FeesVC2
        self.navigationController?.pushViewController(myViewController!, animated: true)
    }
        
        else if(iscome == "Notice"){
        iscome = ""
        let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "NoticeVC2") as? NoticeVC2
        self.navigationController?.pushViewController(myViewController!, animated: true)
    }
        
        else{
            self.selectedIndex = 0
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    
    }

}
