//
//  AboutSchoolVC.swift
//  E learners
//
//  Created by Abdul Naffay on 24/07/2023.
//

import UIKit

class AboutSchoolVC: UIViewController {
    var aboutSchooArray = [AboutSchoolModel]()
    @IBOutlet weak var SchoolNameLbl:UILabel!
    @IBOutlet weak var Schoolimage:UIImageView!
    @IBOutlet weak var AboutSchoolTableView:UITableView!
    var AboutSchoolValue = [String]()
    var AboutSchoolResultValue = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.funcAboutSchoolApi()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        AboutSchoolTableView.dataSource = self
        AboutSchoolTableView.dataSource = self
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    private  func funcAboutSchoolApi() {
        APIServices.AboutSchoolApi() { (result) in
            switch result{
            case .success(let response):
                let data = response.self
                self.AboutSchoolValue = ["Adress","Phone","E-mail","School Code","Current Session","Session Start Month"]
                self.AboutSchoolResultValue.append(data.address ?? "")
                self.AboutSchoolResultValue.append(data.phone ?? "")
                self.AboutSchoolResultValue.append(data.email ?? "")
                self.AboutSchoolResultValue.append(data.diseCode ?? "")
                self.AboutSchoolResultValue.append(data.session ?? "")
                self.AboutSchoolResultValue.append(data.startMonthName ?? "")
                self.SchoolNameLbl.text = "\(response.name ?? "")"
                self.AboutSchoolTableView.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
    
}
extension AboutSchoolVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AboutSchoolValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AboutSchoolTableView.dequeueReusableCell(withIdentifier: "AboutSchoolVCCell", for: indexPath)as! AboutSchoolVCCell
        
        let data = AboutSchoolValue[indexPath.row]
        let result = AboutSchoolResultValue[indexPath.row]
        cell.AboutSchoolValue1.text = data
        cell.AboutSchoolValue2.text = result

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
