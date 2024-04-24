//
//  MyDocumentsVC.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import UIKit

class MyDocumentsVC: UIViewController {
    @IBOutlet weak var tabl:UITableView!
    
    var titleArray = [String]()
    var FileNameArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleArray = ["Test","iOS"]
        FileNameArray = ["title.jpg","12323.jpg"]
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabl.delegate = self
        tabl.dataSource = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func Addbtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "UploadDocuments_VC") as! UploadDocuments_VC
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
}
extension MyDocumentsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabl.dequeueReusableCell(withIdentifier: "MyDocumentsVC_Cell", for: indexPath)as! MyDocumentsVC_Cell
        let data1 = titleArray[indexPath.row]
        let data2 = FileNameArray[indexPath.row]
        cell.TitleLbl.text = data1
        cell.fileNameLbl.text = data2
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    
}
