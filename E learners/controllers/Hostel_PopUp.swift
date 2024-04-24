//
//  Hostel_PopUp.swift
//  E learners
//
//  Created by Abdul Naffay on 15/10/2023.
//

import UIKit

class Hostel_PopUp: UIViewController {
    @IBOutlet weak var hostelName_lbl:UILabel!
    @IBOutlet weak var hostelTbl:UITableView!
    var tittlelbl = String()
   
    var HostelData:hosteldetails?{
        didSet{
            
        }
    }
    var hostelsmodelarray:HostelFullDetailsModel?{
        didSet{
            hostelTbl.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hostelName_lbl.text = tittlelbl
        self.HostelsDetailsApi("1",AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        hostelTbl.delegate = self
        hostelTbl.dataSource = self
    }
    
    private  func HostelsDetailsApi(_ hostelId: String, _ student_id: String) {
        APIServices.HostelsDetailsApi(hostelId: hostelId, student_id: student_id) { (result) in
            switch result{
            case .success(let response):
                self.hostelsmodelarray = response
                let data = response.data?.first
                
                
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
    @IBAction func PopupCloseBtn(sender:Any){
        self.dismiss(animated: true)
        
    }
    
}
extension Hostel_PopUp:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hostelsmodelarray?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hostelTbl.dequeueReusableCell(withIdentifier: "HostelPopup_Cell", for: indexPath)as! HostelPopup_Cell
        let data = hostelsmodelarray?.data?[indexPath.row]
        cell.NumberOfBed_lbl.text = data?.noOfBed
        cell.RoomCost_lbl.text = data?.costPerBed
        cell.RoomNo_lbl.text = data?.roomNo
        cell.RoomType_lbl.text = data?.roomType
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
}
