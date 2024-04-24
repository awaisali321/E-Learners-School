//
//  timeViewController.swift
//  second project
//
//  Created by qaiser on 18/08/2022.
//

import UIKit

class TimeTable_VC: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    var datesarry = [String]()
    var TimeTablesModel:TimeTableModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TimeTableApi(AppDefault.user?.studentID ?? "")
    }
    // Do any additional setup after loading the view.
    override func viewWillAppear(_ animated: Bool) {
        tbl.delegate = self
        tbl.dataSource = self
    }
    
    private  func TimeTableApi( _ student_id: String) {
        APIServices.TimeTableApi(student_id: student_id) {(result) in
            switch result{
            case .success(let response):
                self.TimeTablesModel = response
                self.datesarry = ["Monday","Tuesday","wednesday","Thursday","Friday","Saturday","Sunday"]
                
                self.tbl.reloadData()
            case .failure(let error):
                print(error)

            }
        }
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension TimeTable_VC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesarry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTable_cell") as! TimeTable_cell
        
        let data = datesarry[indexPath.row]
        if(indexPath.row == 0){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.monday
        }
        if(indexPath.row == 1){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.tuesday
        }
        if(indexPath.row == 2){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.wednesday
        }
        if(indexPath.row == 3){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.thursday
        }
        if(indexPath.row == 4){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.friday
        }
        if(indexPath.row == 5){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.saturday
        }
        if(indexPath.row == 6){
            cell.TimeTablesModel = self.TimeTablesModel?.timetable?.sunday
        }
        cell.day_lbl.text = data
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data =  datesarry[indexPath.row]
        var count = Int()
        var sum = Int()
        
        
        if(indexPath.row == 0){
            if self.TimeTablesModel?.timetable?.monday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.monday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 1){
            if self.TimeTablesModel?.timetable?.tuesday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.tuesday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 2){
            if self.TimeTablesModel?.timetable?.wednesday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.wednesday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 3){
            if self.TimeTablesModel?.timetable?.thursday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.thursday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 4){
            if self.TimeTablesModel?.timetable?.friday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.friday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 5){
            if self.TimeTablesModel?.timetable?.saturday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.saturday?.count ?? 0
                sum = 53 * count
            }else{
                sum = 0
            }
        }
        if(indexPath.row == 6){
            if self.TimeTablesModel?.timetable?.sunday?.count ?? 0 > 0{
                count =  self.TimeTablesModel?.timetable?.sunday?.count ?? 0
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
}



