//
//  LibraryBooksVC.swift
//  E learners
//
//  Created by Abdul Naffay on 22/07/2023.
//

import UIKit

class LibraryBooksVC: UIViewController {
    @IBOutlet weak var tblview:UITableView! 
    var LibraryBooks:LibraryBooksModel?
    
        override func viewDidLoad() {
            super.viewDidLoad()

            self.LibraryBooksApi()
        }
    override func viewWillAppear(_ animated: Bool) {
        tblview.delegate = self
        tblview.dataSource = self
    }
    @IBAction func BackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
      
    }
    
    private  func LibraryBooksApi() { APIServices.LibraryBooksApi() { (result) in switch result {
            case .success(let response):
        
                self.LibraryBooks = response
            
 
        self.tblview.reloadData()
            case .failure(let error):
                print(error)
               
            }
        }
    }
}
extension LibraryBooksVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LibraryBooks?.data?.count ?? 0
    }
   
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryBooksCell") as! LibraryBooksCell
            let data = LibraryBooks?.data?[indexPath.row]
            cell.RackNo.text = "Rack No "+"\(data?.rackNo ?? "")"
            cell.Quantity.text = "Quantity "+"\(data?.qty ?? "")"
            cell.Price.text = "Price PKR"+"\(data?.perunitcost ?? "")"
            cell.subject.text = data?.subject
            cell.bookname.text = data?.bookTitle
            cell.AddedOnDate.text = data?.postdate

            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 180
        }
    }

