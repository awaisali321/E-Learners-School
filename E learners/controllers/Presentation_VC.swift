//
//  Presentation_VC.swift
//  E learners
//
//  Created by MUHAMMAD SULEMAN KHAN on 29/11/2023.
//

import UIKit
import Presentr
import Toast_Swift
import RappleProgressHUD
import Presentr
import Alamofire
class Presentation_VC: UIViewController {
    @IBOutlet weak var presentationtbl:UITableView!
    @IBOutlet weak var youtubeBtn:UIButton!
    @IBOutlet weak var FileBtn:UIButton!
    
    var defaultValues = [String]()
    var defaultValues2 = [String]()
    var lessonplanModels:Days?
    var lessonplanPresentationModels:LessonPlanDataPresentationModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        LessonPlanPresentationDataApi(appdelegate.lessonplanModels?.subjectSyllabusID ?? "", appdelegate.lessonplanModels?.subjectGroupID ?? "")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentationtbl.dataSource = self
        presentationtbl.delegate = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func FileBtn(_ sender: Any) {
        FileDownload()
    }
    private  func LessonPlanPresentationDataApi(_ subject_syllabus_id: String,_ subjectid:String) {
        APIServices.LessonPlanDataPresentationApi(subject_syllabus_id: subject_syllabus_id,subjectid:subjectid) {(result) in
            switch result{
            case .success(let response):
                self.lessonplanPresentationModels = response
                  let data = response
                
                
                self.defaultValues = ["Class","Subject","Date","Lesson","Topic","Sub Topic","General Objectives","Teaching Method","Previous Knowledge","Comprehensive Questions"]
               // self.defaultValues2.append(data.data?.createdAt ?? "")
                self.defaultValues2.append("")
                //self.defaultValues2.append(data.data?.createdBy ?? "")
                self.defaultValues2.append("")
                self.defaultValues2.append(data.data?.date ?? "")
                self.defaultValues2.append(data.data?.lessonName ?? "")
                self.defaultValues2.append(data.data?.topicName ?? "")
                self.defaultValues2.append(data.data?.subTopic ?? "")
                self.defaultValues2.append(data.data?.generalObjectives ?? "")
                self.defaultValues2.append(data.data?.teachingMethod ?? "")
                self.defaultValues2.append(data.data?.previousKnowledge ?? "")
                self.defaultValues2.append(data.data?.comprehensiveQuestions ?? "")
                
                if(data.data?.lactureYoutubeURL != ""){
                    self.youtubeBtn.isHidden = false
                }else{
                    self.youtubeBtn.isHidden = true
                }
                if(data.data?.attachment != ""){
                    self.FileBtn.isHidden = false
                }else{
                    self.FileBtn.isHidden = true
                }
                
                self.presentationtbl.reloadData()
            case .failure(let error):
                print(error)

            }
        }
    }
    @objc func FileDownload() {
        let fileURLs: String = "\(appdelegate.imagebaseurl)\(lessonplanPresentationModels?.data?.attachment ?? "")"
        
        DispatchQueue.main.async {
            if let url = URL(string: fileURLs) {
                do {
                    let pdfData = try Data(contentsOf: url)
                    
                    let resDocPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
                    
                    // Use the actual file extension from the URL
                    let pdfFileName = UUID().uuidString + (url.pathExtension.isEmpty ? "" : ".\(url.pathExtension)")
                    
                    let filePath = resDocPath.appendingPathComponent(pdfFileName)
                    
                    // Save to Files
                    try pdfData.write(to: filePath, options: .atomic)
                    print("File Saved")
                    self.showToast(message: "File Download Successfully", font: .systemFont(ofSize: 14.0))
                } catch {
                    print("Error downloading or saving file: \(error.localizedDescription)")
                }
            }
        }
    }
    @objc func openYouTube() {
        if let youtubeURLString = lessonplanPresentationModels?.data?.lactureYoutubeURL,
           let youtubeURL = URL(string: youtubeURLString),
           youtubeURL.host == "www.youtube.com" || youtubeURL.host == "youtube.com" {
            UIApplication.shared.open(youtubeURL)
        } else {
            // Handle invalid YouTube URL
        }
    }
    
    @IBAction func YoutubeBtn(_ sender: Any) {

        openYouTube()
        
    }
    @IBAction func PresentationBtn(_ sender: Any) {
//        let data = lessonplanPresentationModels?.data?[sender.tag]
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: PresentationView_VC.self)) as? PresentationView_VC else {return}
        let presenter = Presentr(presentationType: .custom(width: .fluid(percentage: 1), height: .fluid(percentage: 0.40), center: .center))
        vc.describtionlbl = lessonplanPresentationModels?.data?.presentation?.htmlToString ?? ""
//        vc.txtView.attributedText = htmlString.convertToAttributedFromHTML()
//        let htmlString = "\(lessonplanPresentationModels?.data?.presentation ?? "")"
        presenter.roundCorners = true
        presenter.cornerRadius = 0
        self.customPresentViewController(presenter, viewController: vc, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Presentation_VC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = presentationtbl.dequeueReusableCell(withIdentifier: "Presentation_VC_Cell", for: indexPath)as! Presentation_VC_Cell
        let data = defaultValues[indexPath.row]
        let data2 = defaultValues2[indexPath.row]
        cell.defaultlabel.text = data
        cell.datalabel.text = data2
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
extension Presentation_VC {
    
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


//func loadImageFromURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
//    // Use Alamofire or URLSession to download the image data from the URL
//    // Alamofire example:
//    AF.request(url).responseData { response in
//        switch response.result {
//        case .success(let data):
//            if let image = UIImage(data: data) {
//                completion(image)
//            } else {
//                completion(nil)
//            }
//        case .failure:
//            completion(nil)
//        }
//    }
//}
//func loadHTMLWithImages(_ htmlString: String, into textView: UITextView) {
//    // Parse the HTML string
//    guard let data = htmlString.data(using: .utf8),
//          let attributedString = try? NSAttributedString(data: data,
//                                                         options: [.documentType: NSAttributedString.DocumentType.html],
//                                                         documentAttributes: nil) else {
//        return
//    }
//
//    // Iterate through the attributed string to find image URLs
//    attributedString.enumerateAttribute(.attachment, in: NSRange(location: 0, length: attributedString.length), options: []) { (value, range, _) in
//        if let attachment = value as? NSTextAttachment, let imageURL = attachment.imageURL {
//            // Load the image from the URL
//            loadImageFromURL(imageURL) { image in
//                if let image = image {
//                    // Replace the attachment with the actual image
//                    let newAttachment = NSTextAttachment()
//                    newAttachment.image = image
//                    textView.textStorage.replaceCharacters(in: range, with: NSAttributedString(attachment: newAttachment))
//                }
//            }
//        }
//    }
//
//    // Set the attributed text with images to the UITextView
//    textView.attributedText = attributedString
//}
//
//
//extension NSTextAttachment {
//    var imageURL: URL? {
//        get {
//            return self.fileWrapper?.preferredFilename.flatMap {
//                (self.fileWrapper?.fileWrappers?[$0])?.regularFileContents
//            }.flatMap {
//                URL(dataRepresentation: $0, relativeTo: nil)
//            }
//        }
//    }
//
//    convenience init(imageURL: URL) throws {
//        let imageData = try Data(contentsOf: imageURL)
//        let fileWrapper = try FileWrapper(regularFileWithContents: imageData)
//        fileWrapper.preferredFilename = imageURL.lastPathComponent
//        self.init(fileWrapper: fileWrapper)
//    }
//}
extension String {
    func convertToAttributedFromHTML() -> NSAttributedString? {
        var attributedText: NSAttributedString?
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
        if let data = data(using: .unicode, allowLossyConversion: true), let attrStr = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            attributedText = attrStr
        }
        return attributedText
    }
}
