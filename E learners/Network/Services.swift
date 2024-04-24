//
//  Services.swift
//  RGB
//
//  Created by usamaghalzai on 15/11/2021.
//  Copyright © 2021 usamaghalzai. All rights reserved.
//

import Foundation
import Moya

enum Services {
    //MARK: - AUTHENTICATION
    case login(email:String,password:String)
    case Dashboard(date_to: String,student_id: String, rolename: String,date_from: String)
    case Profile(student_id:String)
    case Fees(student_id:String)
    case HomeWorkApi(student_id:String)
    case ExaminationApi(student_id:String)
    case NoticeBoardApi(student_id:String)
    case AboutSchoolApi
    case HostelsListApi
    case BusRouteApi
    case LibraryBooksApi
    case ReturnedBooksApi(studentId:String)
    case SyllabusStatusApi(student_id:String)
    case TimeTableApi(student_id:String)
    case TimeLineApi(studentId:String)
    case HostelsDetailsApi(hostelId:String,student_id:String)
//    case onlineexamresultApi(onlineexam_student_id:String,exam_id:String)
    case ExamScheduleApi(exam_group_class_batch_exam_id:String)
    case ExamResultsApi(exam_group_class_batch_exam_id:String,student_id:String)
    case lessontopicApi(subject_group_subject_id:String,subject_group_class_sections_id:String)
    case AssignmentsApi(tag:String,sectionId:String,classId:String)
    case StudyMaterialApi(tag:String,sectionId:String,classId:String)
    case DownloadSyllabusApi(tag:String,sectionId:String,classId:String)
    case DownloadOthersApi(tag:String,sectionId:String,classId:String)
    case GetTaskApi(user_id:String)
    case CreateTaskApi(user_id:String,date:String,event_title:String)
    case UpdateTaskApi(status:String,task_id:String)
    case ChildsListApi(user:String,parent_id:String)
    case AttendenceApi(date:String,year:String,student_id:String,month:String)
    case LessonPlanWeeklyApi(date_to:String,student_id:String,date_from:String)
    case LessonPlanPresentationDataApi(subject_syllabus_id:String,subjectid:String)
    
}

extension Services: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL {
        switch self {
        case .login:
            return AppConstants.API.baseURL
            
        default:
            return AppConstants.API.baseURL
        }
        
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
       
        case .Dashboard:
            return "webservice/dashboard"
        case .Profile:
            return "webservice/getStudentProfile"
        case .Fees:
            return "webservice/fees"
        case .HomeWorkApi:
            return "webservice/getHomework"
        case .ExaminationApi:
            return "webservice/getExamList"
        case .NoticeBoardApi:
            return "webservice/getNotifications"
        case .AboutSchoolApi:
            return "webservice/getSchoolDetails"
        case .HostelsListApi:
            return "webservice/getHostelList"
        case .BusRouteApi:
            return "webservice/getTransportRoute"
        case .LibraryBooksApi:
            return "webservice/getLibraryBooks"
        case .ReturnedBooksApi:
            return "webservice/getLibraryBookIssued"
        case .SyllabusStatusApi:
           return "webservice/getsyllabussubjects"
        case .TimeTableApi:
           return "webservice/class_schedule"
        case .TimeLineApi:
           return "webservice/getTimeline"
        case .HostelsDetailsApi:
            return "webservice/getHostelDetails"
//        case .onlineexamresultApi:
//            return "webservice/getOnlineExamResult"
        case .ExamScheduleApi:
            return "webservice/getExamSchedule"
        case .ExamResultsApi:
            return "webservice/getExamResult"
        case .lessontopicApi:
            return "webservice/getSubjectsLessons"
        case .AssignmentsApi:
            return "webservice/getDownloadsLinks"
        case .StudyMaterialApi:
            return "webservice/getDownloadsLinks"
        case .DownloadSyllabusApi:
            return "webservice/getDownloadsLinks"
        case .DownloadOthersApi:
            return "webservice/getDownloadsLinks"
        case .GetTaskApi:
            return "webservice/getTask"
        case .CreateTaskApi:
            return "webservice/addTask"
        case .UpdateTaskApi:
            return "webservice/updateTask"
        case .ChildsListApi:
            return "webservice/Parent_GetStudentsList"
        case .AttendenceApi:
            return "webservice/getAttendenceRecords"
        case .LessonPlanWeeklyApi:
            return "webservice/getlessonplan"
        case .LessonPlanPresentationDataApi:
            return "webservice/getsyllabus"
            
        default:
            return ""
            
        }
    
    }
    
    var method: Moya.Method {
        switch self {
        case .HostelsListApi:
            return .get
        case .LibraryBooksApi:
            return .get
      
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .login(email,password):
            return .requestParameters(parameters: ["deviceToken":"cpVQ6tFcFCo:APA91bHd_KyDod0tR8AQ-irphJBANd1QUpm6nc9Nm3UY4BqVGugJ37jWW7Az-UV82is7e1DKlecPb8dbbFjz8g1m_WPtUxBNvT5RXPoR5OPfKOX9_VUUpYhSQXsr18dGYXTd2LBzErYj","username": email,"password": password], encoding: JSONEncoding.default)
       
            
            
         
            
        case let .Dashboard(dateto,studentid,role,dateform):
            return .requestParameters(parameters: ["date_to":dateto,"student_id": studentid,"role": role,"date_from": dateform], encoding: JSONEncoding.default)
       
        case let .Profile(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
            
        case let .Fees(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
            
        case let .HomeWorkApi(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
            
        case let .ExaminationApi(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
            
        case let .NoticeBoardApi(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
            
        case let .SyllabusStatusApi(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
    
        case let .TimeTableApi(student_id):
            return .requestParameters(parameters: ["student_id":student_id], encoding: JSONEncoding.default)
            
        case let .ReturnedBooksApi(student_id):
            return .requestParameters(parameters: ["studentId":student_id], encoding: JSONEncoding.default)
            
        case let .TimeLineApi(student_id):
            return .requestParameters(parameters: ["studentId":student_id], encoding: JSONEncoding.default)
              
        case let .HostelsDetailsApi(hostelId, student_id):
            return .requestParameters(parameters: ["hostelId" : hostelId, "student_id":student_id],  encoding: JSONEncoding.default)
            
//        case let .onlineexamresultApi(onlineexam_student_id, exam_id):
//            return .requestParameters(parameters: ["onlineexam_student_id" : onlineexam_student_id,"exam_id": exam_id], encoding: JSONEncoding.default)
            
        case let .ExamScheduleApi(exam_group_class_batch_exam_id):
            return .requestParameters(parameters: ["exam_group_class_batch_exam_id":exam_group_class_batch_exam_id], encoding: JSONEncoding.default)
            
        case let .ExamResultsApi(exam_group_class_batch_exam_id,student_id):
            return .requestParameters(parameters: ["exam_group_class_batch_exam_id":exam_group_class_batch_exam_id,"student_id":student_id], encoding: JSONEncoding.default)
            
        case let .lessontopicApi(subject_group_subject_id,subject_group_class_sections_id):
            return .requestParameters(parameters: ["subject_group_subject_id":subject_group_subject_id,"subject_group_class_sections_id":subject_group_class_sections_id], encoding: JSONEncoding.default)
            
        case let .AssignmentsApi(tag,sectionId,classId):
            return .requestParameters(parameters: ["tag":tag,"sectionId":sectionId,"classId":classId], encoding: JSONEncoding.default)
            
        case let .DownloadSyllabusApi(tag,sectionId,classId):
            return .requestParameters(parameters: ["tag":tag,"sectionId":sectionId,"classId":classId], encoding: JSONEncoding.default)
            
        case let .DownloadOthersApi(tag,sectionId,classId):
            return .requestParameters(parameters: ["tag":tag,"sectionId":sectionId,"classId":classId], encoding: JSONEncoding.default)
            
        case let .StudyMaterialApi(tag,sectionId,classId):
            return .requestParameters(parameters: ["tag":tag,"sectionId":sectionId,"classId":classId], encoding: JSONEncoding.default)
            
        case let .GetTaskApi(user_id):
            return .requestParameters(parameters: ["user_id":user_id], encoding: JSONEncoding.default)
            
        case let .CreateTaskApi(user_id,date,event_title):
            return .requestParameters(parameters: ["user_id":user_id,"date":date,"event_title":event_title], encoding: JSONEncoding.default)
            
        case let .UpdateTaskApi(status, task_id):
            return .requestParameters(parameters: ["status":status,"task_id":task_id], encoding: JSONEncoding.default)
            
        case let .ChildsListApi(user, parent_id):
            return .requestParameters(parameters: ["user":user,"parent_id":parent_id], encoding: JSONEncoding.default)
            
        case let .AttendenceApi(date, year, student_id, month):
            return .requestParameters(parameters: ["date" : date,"year":year,"student_id":student_id,"month":month], encoding: JSONEncoding.default)
            
        case let .LessonPlanWeeklyApi(date_to,student_id,date_from):
            return .requestParameters(parameters: ["date_to":date_to,"student_id":student_id,"date_from":date_from], encoding: JSONEncoding.default)
            
        case let .LessonPlanPresentationDataApi(subject_syllabus_id,subjectid):
            return .requestParameters(parameters: ["subject_syllabus_id":subject_syllabus_id,"subjectid":subjectid], encoding: JSONEncoding.default)
            
            
        default:
            return .requestPlain
        }
    }
    
    
    var headers: [String: String]? {
        switch self{
        case .login:
            return [
                  
                "Content-type": "application/json",
                "accept":"*/*",
                "Auth-Key": "schoolAdmin@",
                "Client-Service": "smartschool",
                "Retry-After": "3600"
                
                
                  
                ]
       
            
        default:  return [
               
                "Content-type": "application/json",
                "accept":"*/*",
                "Auth-Key": "schoolAdmin@",
                "Client-Service": "smartschool",
                "Retry-After": "3600",
               
                "User-ID": AppDefault.user?.id ?? "",
                "S-ID": AppDefault.user?.studentID ?? "",
                "Authorization": AppDefault.accessToken
                
              
            ]
            
        }
        
     
    }
    
    var authorizationType: AuthorizationType {
        switch self{
        case .login:
            return .none
        default:
            return .none
        }
    }
    
    var validationType: ValidationType{
        return .successCodes
    }
}
