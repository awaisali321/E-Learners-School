//
//  MyPendingTask.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit
import Presentr
import Toast_Swift
class MyPendingTask: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    @IBOutlet weak var AddBtn:UIButton!
    
    
    let refreshControl = UIRefreshControl()
    var getTaskArray:GetTaskModel?{
        didSet{
            if (getTaskArray?.tasks?.count == 0 ){
                self.showToast(message: "No Tasks Found", font: .systemFont(ofSize: 14.0))
            }else{
                tbl.reloadData()
            }
        }
    }
    
    var selectedindex = Int()
    var items = [Task1]()
    
    var CreateTaskArray:CreateTaskModel?{
        didSet{
            tbl.reloadData()
        }
    }
    
    var UpdateTaskArray:UpdateTaskModel?{
        didSet{
            //            tbl.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbl.reloadData()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        tbl.addSubview(refreshControl)
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
     
    }
    @objc func refresh(sender:AnyObject)
    {
        // Updating your data here...
        self.FuncGetTaskApi(AppDefault.user?.id ?? "")
        self.tbl.reloadData()
        self.refreshControl.endRefreshing()
    }
    override func viewWillAppear(_ animated: Bool) {
        tbl.dataSource = self
        tbl.delegate = self
        self.tbl.reloadData()
        self.FuncGetTaskApi(AppDefault.user?.id ?? "")
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func Addbtn(_ sender: Any) {
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: PendingTaskPOPUPVC.self)) as? PendingTaskPOPUPVC else {return}
        
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 0.8), height: .fluid(percentage: 0.38), center: .center))
        
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
        
    }
    private  func FuncGetTaskApi(_ user_id: String) {
        APIServices.GetTaskApi(user_id: user_id) { (result) in
            switch result{
            case .success(let response):
                self.getTaskArray = response
                let data = response.tasks?.first
                
                
                self.tbl.reloadData()
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    private  func FuncUpdateTaskApi(_ status: String,_ task_id:String) {
        APIServices.UpdateTaskApi(status: status,task_id: task_id) { (result) in
            switch result{
            case .success(let response):
                self.UpdateTaskArray = response
                let data = response
                
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
extension MyPendingTask:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getTaskArray?.tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "MyPendingTaskCell", for: indexPath)as! MyPendingTaskCell
        let data = getTaskArray?.tasks?[indexPath.row]
        cell.getTaskArray = data
        cell.namelbl.text = data?.eventTitle
        cell.datelbl.text = data?.startDate

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedindex = indexPath.row
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from your data source
            items.remove(at: selectedindex)
            
            // Update the table view to reflect the changes
            tbl.deleteRows(at: [indexPath], with: .left)
        }
        
    }
    
}

extension MyPendingTask {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }
