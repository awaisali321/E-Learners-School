//
//  TransportRouteVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class TransportRouteVC: UIViewController {
    @IBOutlet weak var tblview:UITableView!
    
  
    var RouteArray:[TransportRouteModel]?{
        didSet{
            tblview.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BusRoutsApi()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tblview.delegate = self
        tblview.dataSource = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    private  func BusRoutsApi() {
        APIServices.BusRoutsApi() { (result) in
            switch result{
            case .success(let response):
                self.RouteArray = [response]
         
                
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
    
    
}
extension TransportRouteVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RouteArray?.first?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: "TransportRoute_Cell", for: indexPath)as! TransportRoute_Cell
        let data = RouteArray?.first?[indexPath.row]
        cell.routelbl.text = data?.routeTitle
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
