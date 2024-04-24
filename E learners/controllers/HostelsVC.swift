//
//  HostelsVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit
import Presentr

class HostelsVC: UIViewController {
    @IBOutlet weak var tableviews:UITableView!
    var hostelsmodelarray:HostelsModel? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HostelsListApi()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableviews.dataSource = self
        tableviews.delegate = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @objc func HostelView(sender: UIButton){
        let data = hostelsmodelarray?.data?[sender.tag] 
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: Hostel_PopUp.self)) as? Hostel_PopUp else {return}
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
        vc.tittlelbl = data?.hostelName ?? ""
        vc.HostelData = data
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private  func HostelsListApi() {
        APIServices.HostelsListApi() { (result) in
            switch result{
            case .success(let response):
                self.hostelsmodelarray = response
                
                
    
                self.tableviews.reloadData()
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
    
    
}
extension HostelsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hostelsmodelarray?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviews.dequeueReusableCell(withIdentifier: "HostelsVC_Cell", for: indexPath)as! HostelsVC_Cell
        let data = hostelsmodelarray?.data?[indexPath.row]
        cell.hostelnameLBL.text = data?.hostelName
        cell.ViewBtn111.tag = indexPath.row
        cell.ViewBtn111.addTarget(self, action: #selector(HostelView(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        let data = hostelsmodelarray?.data?[indexPath.row]
        
    }
}
