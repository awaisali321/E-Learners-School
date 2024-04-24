//
//  profile2ViewController.swift
//  Backup
//
//  Created by qaiser on 23/08/2022.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var tbl:UITableView!
    @IBOutlet weak var tb2:UITableView!
    @IBOutlet weak var tb3:UITableView!
    var ProfileArray:StudentProfileModel? = nil
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var roll_no_lbl: UILabel!
    @IBOutlet weak var adm_no_lbl: UILabel!
    @IBOutlet weak var class_lbl: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var viewper: UIView!
    @IBOutlet weak var viewparent: UIView!
    @IBOutlet weak var viewother: UIView!
    @IBOutlet weak var BackBtn:UIButton!

    @IBAction func perbtn(_ sender: Any){
        if (viewper.isHidden == true){
            viewper.isHidden=false
            viewparent.isHidden=true
            view1.isHidden=false
            view2.isHidden=true
            viewother.isHidden=true
            view3.isHidden=true
        }
    }
    @IBAction func btnparent(_ sender: Any){
        if (viewparent.isHidden == true){
            viewper.isHidden=true
            viewparent.isHidden=false
            view1.isHidden=true
            view2.isHidden=false
            viewother.isHidden=true
            view3.isHidden=true
        }
    }
    @IBAction func BackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func btnother(_ sender: Any){
        if (viewother.isHidden == true){
            viewper.isHidden=true
            viewparent.isHidden=true
            view1.isHidden=true
            view2.isHidden=true
            viewother.isHidden=false
            view3.isHidden=false
        }
    }
    var personal_value1 = [String]()
    var personal_value_result = [String]()
    var personal_value2 = [String]()
    var other_value1 = [String]()
    var Other_value_result = [String]()
    var other_value2 = [String]()
    var relation_arr = [String]()
    var name_arr = [String]()
    var phone_no_arr = [String]()
    var businessoccupationarray = [String]()
//    var guardianEmailarray = [String]()
//    var guardianAdressarray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.funcProfile(AppDefault.user?.studentID ?? "")
        relation_arr = ["Father","Mother","Guardian"]
       
        view4.addTopShadow(shadowColor: UIColor.gray, shadowOpacity: 0.5, shadowRadius: 2, offset: .zero)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tbl.delegate = self
        tbl.dataSource = self
        tb2.delegate = self
        tb2.dataSource = self
        tb3.delegate = self
        tb3.dataSource = self

    }
    
    private  func funcProfile(_ student_id: String) {
        APIServices.Profile(student_id: student_id) { (result) in
            switch result{
            case .success(let response):

                // MARK: - ProfilePersonalData
                self.ProfileArray = response
                let data = response.StudentResult?.first
                self.personal_value1 = ["Admission date","Date of birth","catogary","Mobile Number","Relligon","E-Mail","Current Adress","Permanent Adress","BloodGroup","Height","Weight","City","Nationality","Domicile","Student CNIC no","Medical Fitness","Any Disability","FSc Marks","MDCAT Marks","Metric Marks"]
                self.personal_value_result.append(data?.admission_date ?? "")
                self.personal_value_result.append(data?.dob ?? "")
                self.personal_value_result.append(data?.category ?? "")
                self.personal_value_result.append(data?.mobileno ?? "")
                self.personal_value_result.append(data?.religion ?? "")
                self.personal_value_result.append(data?.email ?? "")
                self.personal_value_result.append(data?.permanent_address ?? "")
                self.personal_value_result.append(data?.current_address ?? "")
                self.personal_value_result.append(data?.blood_group ?? "")
                self.personal_value_result.append(data?.height ?? "")
                self.personal_value_result.append(data?.weight ?? "")
                self.personal_value_result.append(data?.City ?? "")
                self.personal_value_result.append(data?.Nationality ?? "")
                self.personal_value_result.append(data?.Domicile ?? "")
                self.personal_value_result.append(data?.Student_CNIC_no ?? "")
                self.personal_value_result.append(data?.Medical_fitness ?? "")
                self.personal_value_result.append(data?.Any_disability ?? "")
                self.personal_value_result.append(data?.FSc_Marks ?? "")
                self.personal_value_result.append(data?.MDCAT_Marks ?? "")
                self.personal_value_result.append(data?.Matric_Marks ?? "")
                
                // MARK: - ProfileOtherData
                self.other_value1 = ["Previous School","Bank Account Number","Bank Name","Vehicle Route","Vehicle Number","Driver Name","Driver Contact","Hostels","Room Number","Room Type"]
                self.Other_value_result.append(data?.previous_school ?? "")
                self.Other_value_result.append(data?.bank_account_no ?? "")
                self.Other_value_result.append(data?.bank_name ?? "")
                self.Other_value_result.append(data?.route_title ?? "")
                self.Other_value_result.append(data?.vehicle_no ?? "")
                self.Other_value_result.append(data?.driver_name ?? "")
                self.Other_value_result.append(data?.driver_contact ?? "")
                self.Other_value_result.append(data?.hostel_name ?? "")
                self.Other_value_result.append(data?.room_no ?? "")
                self.Other_value_result.append(data?.room_type ?? "")
                
                // MARK: - UserProfileData
                self.name_lbl.text = "\(data?.firstname ?? "") " + "\(data?.middlename ?? "")"
                self.class_lbl.text = "\(data?.classs ?? "")" + "\(data?.section ?? "")"
                self.adm_no_lbl.text = "Adm. No. " + "\(data?.admission_no ?? "")"
                self.roll_no_lbl.text = "Roll Number " + "\(data?.roll_no ?? "")"
                self.profile_image.pLoadImage(url: appdelegate.imagebaseurl +  (data?.image ?? "") )
                self.name_arr.append(data?.father_name ?? "")
                self.name_arr.append(data?.mother_name ?? "")
                self.name_arr.append(data?.guardian_name ?? "")
                self.phone_no_arr.append(data?.father_phone ?? "")
                self.phone_no_arr.append(data?.mother_phone ?? "")
                self.phone_no_arr.append(data?.guardian_phone ?? "")
//                self.guardianEmailarray.append(data?.guardian_email ?? "")
//                self.guardianAdressarray.append(data?.guardian_address ?? "")
                self.businessoccupationarray.append(data?.father_occupation ?? "")
                self.businessoccupationarray.append(data?.mother_occupation ?? "")
                self.businessoccupationarray.append(data?.guardian_occupation ?? "")

                // MARK: - ReloadingTableViewData
                self.tbl.reloadData()
                self.tb2.reloadData()
                self.tb3.reloadData()
 
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
extension ProfileVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl {
            return personal_value1.count
        }else if(tableView == tb2){
            return name_arr.count
        }else{
            return other_value1.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl {
            let cell = tableView.dequeueReusableCell(withIdentifier: "personal_cell") as! personal_cell
            let data = personal_value1[indexPath.row]
            let result = personal_value_result[indexPath.row]
            cell.personal_lbl1.text = data
            cell.personal_lbl2.text = result

            return cell
        }else if(tableView == tb2){
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "parentTableViewCell") as! parentTableViewCell
            let data = relation_arr[indexPath.row]
            cell1.relation_lbl.text = data
            let data1 = name_arr[indexPath.row]
            cell1.name_lbl.text = data1
            let data2 = phone_no_arr[indexPath.row]
            cell1.phone_no_lbl.text = data2
            let data3  = businessoccupationarray[indexPath.row]
            cell1.Buisness_lbl.text = data3
            
            let data4 = ProfileArray?.StudentResult?.first
//            let data4  = guardianAdressarray[indexPath.row]
            cell1.GuardAdressLbl.text = data4?.guardian_address
//            let data5  = guardianEmailarray[indexPath.row]
            cell1.GuardEmailLbl.text = data4?.guardian_email
         
            
            return cell1
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "other_Cell") as! other_Cell
            let OtherData = other_value1[indexPath.row]
            let OtherResult = Other_value_result[indexPath.row]
            cell.Other_lbl1.text = OtherData
            cell.Other_lbl2.text = OtherResult

            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tbl{
            return 40
            
        }else if(tableView == tb2){
            return 160
            
        }else{
            return 40
        }
    }
}
