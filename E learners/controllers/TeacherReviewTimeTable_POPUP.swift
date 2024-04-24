//
//  TeacherReviewTimeTable_POPUP.swift
//  E learners
//
//  Created by Abdul Naffay on 11/12/2023.
//

import UIKit

class TeacherReviewTimeTable_POPUP: UIViewController {
    @IBOutlet weak var timetbl:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        timetbl.delegate = self
        timetbl.dataSource = self
    }
    
    @IBAction func PopupCloseBtn(sender:Any){
        self.dismiss(animated: true)
        
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
extension TeacherReviewTimeTable_POPUP:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timetbl.dequeueReusableCell(withIdentifier: "TeachersReviewPOPUP_Cell", for: indexPath)as! TeachersReviewPOPUP_Cell
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
