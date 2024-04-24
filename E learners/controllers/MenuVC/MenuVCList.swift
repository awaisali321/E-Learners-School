//
//  ProMenuList.swift
//  AgorzCustomer
//
//  Created by admin on 2/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Presentr

class MenuVCList: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Classname: UILabel!
    @IBOutlet weak var parentChild:UILabel!
    @IBOutlet weak var SwitchChildBtn:UIButton!
    @IBOutlet weak var tableview: UITableView!
    let kMainStoryBoard             =   UIStoryboard(name: "Main", bundle: nil)
    @IBOutlet var menuview: UIView!
  
    var data = [String]()
    var imagedata = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if(AppDefault.user?.role == "parent"){
            self.parentChild.isHidden = false
            self.SwitchChildBtn.isHidden = false
            for item in AppDefault.user?.parent_childs ?? []{
                if(AppDefault.user?.studentID == item.student_id){
                    self.Classname.text = "\(item.name ?? "")"
                    self.parentChild.text = "\(item.classes ?? "")" + "\(item.section ?? "")"
                }
            }
            self.img.pLoadImage(url: appdelegate.imagebaseurl +  (AppDefault.user?.image ?? ""))
            self.name.text = "\(AppDefault.user?.username ?? "")"
        }else{
            self.parentChild.isHidden = true
            self.SwitchChildBtn.isHidden = true
            self.img.pLoadImage(url: appdelegate.imagebaseurl +  (AppDefault.user?.image ?? ""))
            self.name.text = "\(AppDefault.user?.username ?? "")"
            self.Classname.text = "\(AppDefault.user?.recordClass ?? "")" + "\(AppDefault.user?.section ?? "")"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
       
        self.CreateMenuitemList()
      
    }
    func showchildList(data:CurrentUser){
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: CHILD_LIST.self)) as? CHILD_LIST else {return}
       
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
    
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
  
    }
    @IBAction func SwitchChildBtn(_ sender: UIButton) {
        if(AppDefault.user?.role == "parent"){
            self.showchildList(data: AppDefault.user!)
        }else{
            
        }
    }
    
    @IBAction func btnMenu_click(_ sender: Any) {
        self.sideMenuController?.toggle()
    }
    func CreateMenuitemList() {
        imagedata = ["home_icon","ic_profile_plus","ic_nav_fees","ic_calender_time","ic_clipboard_filled","baseline_receipt","homework","ic_calender_cross","ic_nav_download","ic_dashboard_attendance","ic_nav_reportcard","ic_email_filled","ic_briefcase","pdf_file","ic_teacher","ic_nav_library","ic_nav_transport","ic_nav_hostel","ic_info","ic_nav_logout"]
        
        data = ["Home","Profile","Fees","Time Table","Lesson Plan","Syllabus Status",
                "Home Work","Apply Leave","Download Center","Attendance", "Examination","Notice Board","Timeline","My Documents","Teachers Review","Library","Transport Route","Hostels","About College","Log Out"]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        cell.selectionStyle = .none
        
        let dict = data[indexPath.row]
        cell.imagelbl.image = UIImage(named : imagedata[indexPath.row])
        
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.lab.text =  dict
             
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 50


    }
   

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SideMenuCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let dict = data[indexPath.row]
        
        
        if (dict == "Home"){
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "home"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        
        else if(dict == "Profile"){
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Profile"
            sideMenuController?.embed(centerViewController: myViewController!)
        }
        else if(dict == "Fees"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Fees"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }else if(dict == "Time Table"){
            
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "timetable"
            sideMenuController?.embed(centerViewController: myViewController!)
            
            
        }
        else if(dict == "Lesson Plan"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Lesson Plan"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Syllabus Status"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Syllabus Status"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Home Work"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Home Work"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }

        else if(dict == "Apply Leave"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Apply Leave"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Download Center"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Download Center"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Attendance"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Attendance"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Examination"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Examination"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }else if(dict == "Notice Board"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Notice"
            
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Timeline"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Timeline"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "My Documents"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "My Documents"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Teachers Review"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Teachers Review"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Library"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "BookInfoVC") as? BookInfoVC
            
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Transport Route"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Transport Route"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "Hostels"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "Hostels"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        else if(dict == "About College"){
            
            let myViewController = kMainStoryBoard.instantiateViewController(withIdentifier: "Menu_TB") as? Menu_TB
            myViewController?.iscome = "About College"
            sideMenuController?.embed(centerViewController: myViewController!)
            
        }
        
        
        else{
            UserDefaults.standard.set(false, forKey: "islogin")
            UserDefaults.standard.set("", forKey: "Username")
            UserDefaults.standard.set("", forKey: "password")
            
            appdelegate.gotoSignInVc()
        }
        
        
        
    }
    
}

