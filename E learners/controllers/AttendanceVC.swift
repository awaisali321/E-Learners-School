//
//  AttendenceVC.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit
import FSCalendar

class AttendanceVC: UIViewController{
    @IBOutlet weak var CalanderVIEW: UIView!
    @IBOutlet weak var Calender:FSCalendar!
    var calendarData: AttendenceModel? {
        didSet{
            self.Calender.reloadData()
        }
    }
    let date = Date()
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var PresentEventDates = [String]()
    var AbsentEventDates = [String]()
//    var DwithE = ["2023-11-13 present ","2023-11-14","2023-11-15 absent","2023-11-16","2023-11-17 present","2023-11-18 absent"]
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        self.funcAttendence("2023-11-18","2023",AppDefault.user?.studentID ?? "","11")
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
        Calender.delegate = self
        Calender.dataSource = self
        Calender.allowsSelection = false
    }

    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
//    func renderCalendarDot(for date: Date, color: String) {
//        print("Rendering dot for \(date) with color \(color)")
//        // Implement your logic to render a dot on the calendar for the given date with the specified color
//        // This can be achieved using UI components, depending on the platform you are working with.
//    }
    


    
    private  func funcAttendence(_ date: String, _ year: String, _ student_id: String, _ month: String) {
        APIServices.AttendenceApi(date: date, year: year,student_id: student_id, month: month) { (result) in
            switch result{
            case .success(let response):
                self.calendarData = response

                for item in response.data ?? []{
                    if(item.type == "Present"){
                        self.PresentEventDates.append(item.date ?? "")
                        
                    }else if (item.type == "Absent"){
                        self.AbsentEventDates.append(item.date ?? "")
                    }else{
                        
                    }
                   
                }
                self.Calender.reloadData()
               
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension AttendanceVC:FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance{
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        
        let dateString = self.dateFormatter2.string(from: date)
        if (self.PresentEventDates.contains(dateString)){
            
            return 1
        }else if (self.AbsentEventDates.contains(dateString)){

            return 1
        }else{
            return 0
        }
        
    }


    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        
        let dateString = self.dateFormatter2.string(from: date)
        
        
        if (self.PresentEventDates.contains(dateString)){
            return [UIColor.green, appearance.eventDefaultColor, UIColor.clear]
        }
        if (self.AbsentEventDates.contains(dateString)){
            
            return [UIColor.red, appearance.eventDefaultColor, UIColor.clear]
        }
            return nil
     }
}
