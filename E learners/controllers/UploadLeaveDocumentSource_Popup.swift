//
//  UploadLeaveDocumentSource_Popup.swift
//  E learners
//
//  Created by Abdul Naffay on 22/10/2023.
//

import UIKit
import UniformTypeIdentifiers
import PDFKit

class UploadLeaveDocumentSource_Popup: UIViewController {
    var capturedImage : UIImage?
//    var capturedDocument:PDFDocument?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let pdfURL = Bundle.main.url(forResource: "", withExtension: "pdf") {
//                    if let pdfDocument = PDFDocument(url: pdfURL) {
//                        let pdfView = PDFView(frame: view.bounds)
//                        pdfView.autoScales = true
//                        pdfView.document = pdfDocument
//                        view.addSubview(pdfView)
//                    } else {
//                        print("Failed to create PDF document from URL")
//                    }
//                } else {
//                    print("PDF file not found in the bundle")
//                }
//
        // Do any additional setup after loading the view.
    }

    @IBAction func OpenCameraBtn(_ sender: Any) {
        //     proceedWithCameraAccess(identifier: "Open Camera")
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                present(picker, animated: true)
        
       
    }
    @IBAction func DismissBtn(_ sender: Any) {
        self.dismiss(animated: true)

    }


    @IBAction func ChooseFromFilesBtn(_ sender: Any) {
       
        if #available(iOS 14.0, *) {
            let supportedTypes: [UTType] = [UTType.pdf,UTType.image,UTType.jpeg,UTType.png]
            let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
            pickerViewController.delegate = self
            pickerViewController.allowsMultipleSelection = false
            pickerViewController.shouldShowFileExtensions = true
            self.present(pickerViewController, animated: true, completion: nil)

        } else {
            // Fallback on earlier versions
        }
      
    }

    @IBAction func openFilePicker() {
       
     }
}
extension UploadLeaveDocumentSource_Popup:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            capturedImage = image
            picker.dismiss(animated: true,completion: nil)

            }  
        }
    }



extension UploadLeaveDocumentSource_Popup: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedURL = urls.first {

            
            saveUploadedFile(selectedURL)


        }
    }
}
