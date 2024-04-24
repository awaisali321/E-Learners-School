//
//  TeacherReviewVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit
import Presentr
class TeacherReviewVC: UIViewController {
    @IBOutlet weak var teachersReviewTbl:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        teachersReviewTbl.dataSource = self
        teachersReviewTbl.delegate = self
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func AddRatingBtn(sender: UIButton){
        
        //        let data = noticemodelarray?.data?[sender.tag]
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: RATING_VC.self)) as? RATING_VC else {return}
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 0.9), height: .fluid(percentage: 0.40), center: .center))
        
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
        
    }
    @objc func ViewBtn(sender: UIButton){
        
        //        let data = noticemodelarray?.data?[sender.tag]
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: TeacherReviewTimeTable_POPUP.self)) as? TeacherReviewTimeTable_POPUP else {return}
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
        
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
        
    }
    

}
extension TeacherReviewVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teachersReviewTbl.dequeueReusableCell(withIdentifier: "TeachersReviewCell", for: indexPath)as!
        TeachersReviewCell
        cell.AddRatingBtn.tag = indexPath.row
        cell.AddRatingBtn.addTarget(self, action: #selector(AddRatingBtn(sender:)), for: .touchUpInside)
        cell.ViewBtn.tag = indexPath.row
        cell.ViewBtn.addTarget(self, action: #selector(ViewBtn(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }

}
