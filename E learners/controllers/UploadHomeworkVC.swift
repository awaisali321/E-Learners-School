//
//  UploadHomeworkVC.swift
//  E learners
//
//  Created by Abdul Naffay on 14/11/2023.
//

import UIKit
import Presentr
import UniformTypeIdentifiers
import PDFKit
class UploadHomeworkVC: UIViewController {
    @IBOutlet weak var documentImage:UIImageView!
    var ReceiveimageArray:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func ChoseFileBtn(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
            self.documentImage.image = image
           }
        
    }

    func saveDocument(at url: URL) {
        do {
                   let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   let destinationURL = documentsDirectory.appendingPathComponent(url.lastPathComponent)

                   // Copy the selected document to the desired location
                   try FileManager.default.copyItem(at: url, to: destinationURL)

                   // Handle the saved document as needed
                   print("Document saved at: \(destinationURL.absoluteString)")
               } catch {
                   // Handle the error
                   print("Error saving document: \(error.localizedDescription)")
               }
           

               // Display the saved document
               displayDocument(at: url)
           }
       

//    func displayDocument(at url: URL) {
//        if let pdfDocument = PDFDocument(url: url) {
//            // Get the first page of the PDF as an image
//            if let pdfPage = pdfDocument.page(at: 0) {
//                let image = pdfPage.thumbnail(of: documentImage.bounds.size, for: .cropBox)
//                documentImage.image = image
//            }
//        }
//    }
//     Function to display the document in the imageView
    func displayDocument(at url: URL) {
        do {
            // Load the data from the document URL
            let imageData = try Data(contentsOf: url)

            // Convert the data to a UIImage
            if let image = UIImage(data: imageData) {
                // Set the UIImage to the imageView
                documentImage.image = image
            } else {
                print("Failed to create UIImage from data")
            }
        } catch {
            print("Error loading data from URL: \(error)")
        }
    }
//    func displayPDF(url: URL) {
//        if let document = PDFDocument(url: url) {
//            // Assuming you want to display the first page of the PDF
//            if let page = document.page(at: 0) {
//                let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: page.bounds(for: .mediaBox).width, height: page.bounds(for: .mediaBox).height))
//                let data = pdfRenderer.pdfData { context in
//                    context.beginPage()
//                    page.draw(with: .mediaBox, to: context.cgContext)
//                }
//
//                if let image = UIImage(data: data) {
//                    documentImage.image = image
//                }
//            }
//        }
//    }
    @IBAction func SubmitBtn(_ sender: Any) {
        
        
    }
//    func displayDocument(at url: URL) {
//           displayPDF(url: url)
//       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
