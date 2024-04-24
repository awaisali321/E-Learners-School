//
//  ApplyLeaveDocuments_VC.swift
//  E learners
//
//  Created by Abdul Naffay on 22/10/2023.
//

import UIKit
import Presentr


class ApplyLeaveDocuments_VC: UIViewController {
    @IBOutlet weak var CurrentDateFld:UITextField!
    @IBOutlet weak var FromDateFld:UITextField!
    @IBOutlet weak var ToDateFld:UITextField!
    @IBOutlet weak var ReasonFld:UITextField!
    @IBOutlet weak var imageviewer:UIImageView!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        ToDateFld.addInputViewDatePicker(target: self, selector: #selector(ToDatePressed))
        FromDateFld.addInputViewDatePicker(target: self, selector: #selector(FromDatePressed))
        CurrentDateFld.addInputViewDatePicker(target: self, selector: #selector(CurrentDatePressed))
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func ChooseFileBtn(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
            self.imageviewer.image = image
           }
//        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: UploadLeaveDocumentSource_Popup.self)) as? UploadLeaveDocumentSource_Popup else {return}
//        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 0.8), height: .fluid(percentage: 0.38), center: .center))
////        vc.capturedImage = imageviewer.image
//
//        presenter.roundCorners = true
//        presenter.cornerRadius = 0
//        self.customPresentViewController(presenter, viewController: vc, animated: true)
    }
    
    @IBAction func SubmitBtn(_ sender: Any) {
        
        
    }
    
    @objc func ToDatePressed() {
        if let  datePicker = self.ToDateFld.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
            self.ToDateFld.text = dateFormatter.string(from: datePicker.date)
        }
        self.ToDateFld.resignFirstResponder()
    }
    @objc func FromDatePressed() {
        if let  datePicker = self.FromDateFld.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
            self.FromDateFld.text = dateFormatter.string(from: datePicker.date)
        }
        self.FromDateFld.resignFirstResponder()
    }
    @objc func CurrentDatePressed() {
        if let  datePicker = self.CurrentDateFld.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
            self.CurrentDateFld.text = dateFormatter.string(from: datePicker.date)
        }
        self.CurrentDateFld.resignFirstResponder()
    }
    
}

