//
//  BookinfoViewController.swift
//  Backup
//
//  Created by qaiser on 20/08/2022.
//

import UIKit

class BookInfoVC: UIViewController {
    
    
    @IBOutlet weak var tbl1:UITableView!
    
    var LibraryBooksInfo:[LibraryReturnedBooksModel]?{
        didSet{
            tbl1.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.ReturnedBookApi(AppDefault.user?.studentID ?? "")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tbl1.delegate = self
        tbl1.dataSource = self
    }
    @IBAction func sidemenu(_ sender: Any) {
        self.sideMenuController?.toggle()
    }
    
    @IBAction func Booksbtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibraryBooksVC") as? LibraryBooksVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    private  func ReturnedBookApi(_ student_id: String) {
        APIServices.ReturnedBooksApi(student_id: student_id) {(result) in
            switch result{
            case .success(let response):
                self.LibraryBooksInfo = [response]
           
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

extension BookInfoVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LibraryBooksInfo?.first?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookInfoCell") as! BookInfoCell
        let data = LibraryBooksInfo?.first?[indexPath.row]
        cell.book_name_lbl.text = data?.bookTitle
        cell.book_writer_lbl.text = data?.author
        cell.Book_no_lbl.text = data?.bookNo
        cell.Due_date_lbl.text = data?.dueReturnDate
        cell.retuurn_date_lbl.text = data?.returnDate
        cell.issue_date_lbl.text = data?.issueDate
        
        if (data?.isReturned == "1"){
            cell.status_lbl.text = "Returned"
            cell.status_view.backgroundColor = UIColor.systemGreen
        }else if(data?.isReturned == "0"){
            cell.status_lbl.text = "NotReturned"
            cell.status_view.backgroundColor = UIColor.systemRed
        }else{
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
        
    }
}
