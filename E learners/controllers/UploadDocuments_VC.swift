//
//  UploadDocuments_VC.swift
//  E learners
//
//  Created by Abdul Naffay on 21/10/2023.
//

import UIKit
import UniformTypeIdentifiers

class UploadDocuments_VC: UIViewController {
    @IBOutlet weak var titleFld:UITextField!
    @IBOutlet weak var fileimg:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func ChooseFileBtn(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
            self.fileimg.image = image
            //        if #available(iOS 14.0, *) {
            //            let supportedTypes: [UTType] = [UTType.pdf,UTType.image,UTType.jpeg]
            //            let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
            //            pickerViewController.delegate = self
            //            pickerViewController.allowsMultipleSelection = false
            //            pickerViewController.shouldShowFileExtensions = true
            //            self.present(pickerViewController, animated: true, completion: nil)
            //
            //        } else {
            //            // Fallback on earlier versions
            //        }
            
        }
    }
    
    
    @IBAction func SubmitBtn(_ sender: Any) {
        
        
    }
    
}
extension UploadDocuments_VC: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedURL = urls.first {
            // Handle the selected file (e.g., save it to your app's directory).
            
            saveUploadedFile(selectedURL)
            
        }
    }
}








