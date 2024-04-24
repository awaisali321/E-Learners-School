//
//  PendingTaskPOPUPVC.swift
//  E learners
//
//  Created by Abdul Naffay on 24/07/2023.
//

import UIKit
import Toast_Swift

class PendingTaskPOPUPVC: UIViewController {
    @IBOutlet weak var TaskTitle:UITextField!
    @IBOutlet weak var TaskDate:UITextField!
    @IBOutlet weak var SubmitBtn:UIButton!
    let kMainStoryBoard             =   UIStoryboard(name: "Main", bundle: nil)
    var CreateTaskArray:CreateTaskModel?
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskDate.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressed))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SubmitBtn(_ sender: Any) {
        if (TaskDate.text != "" && TaskTitle.text != ""){
            self.FuncCreateTaskApi(AppDefault.user?.id ?? "", TaskDate.text!, TaskTitle.text!)
            
            self.showToast(message: "Task Created Successfully", font: .boldSystemFont(ofSize: 14))
            self.dismiss(animated: true)
            
        }else{
            
        }
        
    }
    @objc func doneButtonPressed() {
        if let  datePicker = self.TaskDate.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .automatic
            } else {
                // Fallback on earlier versions
            }
            self.TaskDate.text = dateFormatter.string(from: datePicker.date)
        }
        self.TaskDate.resignFirstResponder()
    }
    
    @IBAction func CrossBtn(_ Sender: Any){
        self.dismiss(animated: true)
        
    }
    private  func FuncCreateTaskApi(_ user_id: String,_ date:String,_ event_title:String) {
        APIServices.CreateTaskApi(user_id: user_id,date: date,event_title: event_title) { (result) in
            switch result{
            case .success(let response):
                self.CreateTaskArray = response
                
        
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

