//
//  DashboardModel.swift
//  E learners
//
//  Created by Abdul Naffay on 31/07/2023.
//

import Foundation
extension homeVC{
    // MARK: - DashboardModel
    struct DashboardModel: Codable {
        let attendenceType, classID, sectionID: String?
        let studentAttendencePercentage, studentHomeworkIncomplete, studentIncompleteTask: Int?
        
        
        let dateLists: String?
        
       enum CodingKeys: String, CodingKey {
            case attendenceType = "attendence_type"
            case classID = "class_id"
            case sectionID = "section_id"
            case studentAttendencePercentage = "student_attendence_percentage"
            case studentHomeworkIncomplete = "student_homework_incomplete"
            case studentIncompleteTask = "student_incomplete_task"
            
            case dateLists = "date_lists"
        }
    }
}
