//
//  FeesVC2.swift
//  E learners
//
//  Created by Abdul Naffay on 27/08/2023.
//

import UIKit

class CHILD_LIST: UIViewController {
    @IBOutlet weak var tb2:UITableView!
    var modelLogin: Userdata? {
        didSet {
            if modelLogin?.token != nil {
                
                
                
                UserDefaults.standard.set(self.modelLogin?.token ?? "", forKey: "token")
        
            }
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(modelLogin != nil){
            
        }else{
            modelLogin?.record = AppDefault.user
            self.tb2.reloadData()
        }
        
    }
    // Do any additional setup after loading the view.
    
    @IBAction func BackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        // Configure the view for the selected
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension CHILD_LIST: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(modelLogin?.record != nil){
            return modelLogin?.record?.parent_childs?.count ?? 0
        }else{
            return AppDefault.user?.parent_childs?.count ?? 0
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "CHILD_LIST_CELL") as! CHILD_LIST_CELL
        
        if(modelLogin?.record != nil){
        
            let data = modelLogin?.record?.parent_childs?[indexPath.row]
            cell1.name_lbl.text = data?.name ?? ""
            cell1.section_lbl.text = "\(data?.classes ?? "") - " + "\(data?.section ?? "")"
            cell1.image_user.pLoadImage(url: appdelegate.imagebaseurl +  (data?.image ?? ""))
            
        }else{
         
            let data = AppDefault.user?.parent_childs?[indexPath.row]
            cell1.name_lbl.text = data?.name ?? ""
            cell1.section_lbl.text = "\(data?.classes ?? "") - " + "\(data?.section ?? "")"
            cell1.image_user.pLoadImage(url: appdelegate.imagebaseurl +  (data?.image ?? ""))
        }
        
        
        
       
        return cell1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(modelLogin?.record != nil){
            let data = modelLogin?.record?.parent_childs?[indexPath.row]
            AppDefault.user?.studentID = data?.student_id
            AppDefault.user?.image = data?.image
            appdelegate.GotoDashBoard()
        }else{
            let data = AppDefault.user?.parent_childs?[indexPath.row]
            AppDefault.user?.studentID = data?.student_id
            AppDefault.user?.image = data?.image
            appdelegate.GotoDashBoard()
        }
        
        
     
    }
}
