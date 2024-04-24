//
//  FeesVC2.swift
//  E learners
//
//  Created by Abdul Naffay on 27/08/2023.
//

import UIKit

class Fees_Detail_PopUp: UIViewController {
    @IBOutlet weak var tb2:UITableView!
   
    var duefees:StudentDueFee?{
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    @IBAction func PopUpCloseBtn(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        // Configure the view for the selected
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
extension Fees_Detail_PopUp: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return duefees?.fees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb2.dequeueReusableCell(withIdentifier: "Fees_detail_Cell", for: indexPath)as! Fees_detail_Cell
        let data = duefees?.fees?[indexPath.row]
        cell.id.text = "\(data?.studentFeesDepositeID ?? "")/" + "\(data?.feeGroupsID ?? "")"
        cell.date.text = data?.dueDate
        cell.discount.text = data?.totalAmountDiscount
        cell.fine.text = "RS" + "\(data?.feesFineAmount ?? "")"
        
        cell.paid.text = data?.totalAmountPaid
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
}
