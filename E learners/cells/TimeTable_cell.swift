//
//  feeCell.swift
//  second project
//
//  Created by qaiser on 15/08/2022.
//

import UIKit

class TimeTable_cell: UITableViewCell {
  
    @IBOutlet weak var datatable:UITableView!
    @IBOutlet weak var day_lbl:UILabel!
    
    
    
    var TimeTablesModel:[Day]?{
        didSet{
            datatable.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        datatable.dataSource = self
        datatable.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
extension TimeTable_cell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimeTablesModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datatable.dequeueReusableCell(withIdentifier: "TimeTableCell2", for: indexPath)as! TimeTableCell2
        
        let data = TimeTablesModel?[indexPath.row]
        cell.timelbl.text = (data?.startTime ?? "") + " - " + (data?.endTime ?? "")
        cell.subjectlbl.text = data?.subjectName
        cell.RoomNolbl.text = data?.roomNo
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 43
    }
}
