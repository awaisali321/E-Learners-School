//
//  FeesVC2.swift
//  E learners
//
//  Created by Abdul Naffay on 27/08/2023.
//

import UIKit
import Presentr
class FeesVC2: UIViewController {
    @IBOutlet weak var tb2:UITableView!
    @IBOutlet weak var amount1: UILabel!
    @IBOutlet weak var amount2: UILabel!
    @IBOutlet weak var amount3: UILabel!
    @IBOutlet weak var discount1: UILabel!
    @IBOutlet weak var discount2: UILabel!
    @IBOutlet weak var paid1: UILabel!
    @IBOutlet weak var paind2: UILabel!
    @IBOutlet weak var fine1: UILabel!
    @IBOutlet weak var fine2: UILabel!
    @IBOutlet weak var balance1: UILabel!
    @IBOutlet weak var discountNamelbl:UILabel!
    @IBOutlet weak var discountAmmountLbl:UILabel!
    @IBOutlet weak var viewbtn:UIButton!
    var feesmodel:StudentFeesModel?
    var duefees:[StudentDueFee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.funcFees(AppDefault.user?.studentID ?? "")
    }
    // Do any additional setup after loading the view.
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @objc func ViewBtn(sender: UIButton){
        let data = feesmodel?.studentDueFee?[sender.tag]
        if(feesmodel?.studentDueFee?.first?.fees?.first?.status == "paid"){
            guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: Fees_Detail_PopUp.self)) as? Fees_Detail_PopUp else {return}
            vc.duefees = data
           
            let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
            
            presenter.roundCorners = true
            presenter.cornerRadius = 0
            self.customPresentViewController(presenter, viewController: vc, animated: true)
        }else{
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        // Configure the view for the selected
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    private  func funcFees( _ student_id: String) {
        APIServices.Fees(student_id: student_id) { (result) in
            switch result{
            case .success(let response):
                self.feesmodel = response
                self.amount1.text = "\(response.grandFee?.amount ?? "")"
                self.discount1.text = "\(response.grandFee?.amountDiscount ?? "")"
                self.fine1.text = "\(response.grandFee?.amountFine ?? "")"
                self.paid1.text = "\(response.grandFee?.amountPaid ?? "")"
                self.balance1.text = "\(response.grandFee?.amountRemaining ?? "")"
                self.amount3.text = "+" + "\(response.grandFee?.feeFine ?? 0)"
                self.discountNamelbl.text = "\(response.studentDiscountFee?.first?.name ?? "") " + "\(response.studentDiscountFee?.first?.code ?? "")"
                self.discountAmmountLbl.text = "Discount of Rs" + "\(response.studentDiscountFee?.first?.amount ?? "")" + " applied - " + "\(response.studentDiscountFee?.first?.paymentID ?? "")"
                self.tb2.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

extension FeesVC2: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feesmodel?.studentDueFee?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "FeesCell2") as! FeesCell2
        let data = feesmodel?.studentDueFee?[indexPath.row]
        cell1.heading_lbl.text = "\(data?.fees?.first?.name ?? "")-" + "\(data?.fees?.first?.code ?? "")"
        cell1.fees_code_lbl.text = data?.fees?.first?.code
        cell1.Due_datew_lbl.text = data?.fees?.first?.dueDate
        cell1.ammount_lbl.text = data?.fees?.first?.amount
        cell1.Fine_lbl.text = data?.fees?.first?.fineAmount
        cell1.ammount_lbl_2.text =  "+" + "\(data?.fees?.first?.fineAmount ?? "")"
        cell1.Discount_lbl.text = data?.fees?.first?.totalAmountDiscount
        cell1.Paid_AMT_lbl.text = data?.fees?.first?.totalAmountPaid
        cell1.Balance_amt.text = data?.fees?.first?.totalAmountRemaining
        cell1.text_lbl.text = data?.fees?.first?.status
        if(cell1.text_lbl.text == "paid"){
            cell1.Status_View.backgroundColor = UIColor.systemGreen
        }else if(cell1.text_lbl.text == "pending"){
            cell1.Status_View.backgroundColor = UIColor.orange
        }else if(cell1.text_lbl.text == "unpaid"){
            cell1.Status_View.backgroundColor = UIColor.red
            cell1.DueDate_View.backgroundColor = UIColor.red
            cell1.viewbtn.isHidden = true
        }
        cell1.viewbtn.tag = indexPath.row
        cell1.viewbtn.addTarget(self, action: #selector(ViewBtn(sender:)), for: .touchUpInside)
        return cell1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
}
