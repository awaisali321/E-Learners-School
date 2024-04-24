//
//  User.swift
//  E learners
//
//  Created by Abdul Naffay on 24/07/2023.
//

import Foundation
extension  LogInVC{
    // MARK: - StudentModel
    struct StudentModel: Codable {
        let status: Int?
        let message, id, token, role: String?
        let record: Record?
    }
    
    // MARK: - Record
    struct Record: Codable {
        let id, studentID, role, username: String?
        let recordClass, section, dateFormat, currencySymbol: String?
        let timezone, schName: String?
        let language: Language?
        let isRTL, theme, image, startWeek: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case studentID = "student_id"
            case role, username
            case recordClass = "class"
            case section
            case dateFormat = "date_format"
            case currencySymbol = "currency_symbol"
            case timezone
            case schName = "sch_name"
            case language
            case isRTL = "is_rtl"
            case theme, image
            case startWeek = "start_week"
        }
    }
    
    // MARK: - Language
    struct Language: Codable {
        let langID, language: String?
        
        enum CodingKeys: String, CodingKey {
            case langID = "lang_id"
            case language
        }
    }
}
