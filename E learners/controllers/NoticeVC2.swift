//
//  NoticeVC2.swift
//  E learners
//
//  Created by Abdul Naffay on 27/08/2023.
//

import UIKit
import Presentr
class NoticeVC2: UIViewController {
    @IBOutlet weak var tb2:UITableView!  
    let kMainStoryBoard             =   UIStoryboard(name: "Main", bundle: nil)
    var noticemodelarray:NoticeModel?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NoticeBoardApi(AppDefault.user?.studentID ?? "")
        // Do any additional setup after loading the view.
    }
    @objc func viewBtn(sender: UIButton){
        let data = noticemodelarray?.data?[sender.tag]
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: ANNOUNCEMENT_POPUP.self)) as? ANNOUNCEMENT_POPUP else {return}
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
        vc.tittlelbl = data?.title ?? ""
        vc.describtionlbl = data?.message?.htmlToString ?? ""
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
        
    }
    private  func NoticeBoardApi(_ student_id: String) {
        APIServices.NoticeBoardApi(student_id: student_id) { (result) in
            switch result{
            case .success(let response):
                self.noticemodelarray = response
                let data = response.data?.first
                self.tb2.reloadData()
                
            case .failure(let error):
                print(error)
            
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tb2.delegate = self
        tb2.dataSource = self
        
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension NoticeVC2: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "NoticeCell2") as! NoticeCell2
        let data = noticemodelarray?.data?[indexPath.row]
        cell1.heading_lbl.text = data?.title
        cell1.Date_lbl.text = data?.date
        cell1.Viewbtn.tag = indexPath.row
        cell1.Viewbtn.addTarget(self, action: #selector(viewBtn(sender:)), for: .touchUpInside)
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection Section: Int) -> Int{
        return noticemodelarray?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 110
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
