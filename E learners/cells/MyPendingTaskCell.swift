//
//  MyPendingTaskCell.swift
//  E learners
//
//  Created by Abdul Naffay on 23/07/2023.
//

import UIKit

class MyPendingTaskCell: UITableViewCell {
    @IBOutlet weak var namelbl:UILabel!
    @IBOutlet weak var checkbtn:UIButton!
    @IBOutlet weak var datelbl:UILabel!
    @IBOutlet weak var lineView:UIView!
    var UpdateTaskArray:UpdateTaskModel?
    var getTaskArray:Task1?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    private  func FuncUpdateTaskApi(_ status: String,_ task_id:String) {
        APIServices.UpdateTaskApi(status: status,task_id: task_id) { (result) in
            switch result{
            case .success(let response):
                self.UpdateTaskArray = response
                let data = response
               
               
//                self.tbl.reloadData()
                
            case .failure(let error):
                print(error)
               
            }
            
        }
        
    }

    @IBAction func checkbtn(_ sender: Any) {
  
        if(checkbtn.isSelected == false){
            checkbtn.isSelected = true
            lineView.isHidden = false
            FuncUpdateTaskApi(getTaskArray?.isActive ?? "",getTaskArray?.id ?? "" )
        }else{
            checkbtn.isSelected = false
            lineView.isHidden = true
            FuncUpdateTaskApi(getTaskArray?.isActive ?? "",getTaskArray?.id ?? "" )
        }
     
    }
    
}
