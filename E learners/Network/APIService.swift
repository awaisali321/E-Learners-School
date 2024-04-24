//
//  Services.swift
//  RGB
//
//  Created by usamaghalzai on 15/11/2021.
//  Copyright © 2021 usamaghalzai. All rights reserved.
//

import Moya
import Foundation
import GooglePlaces
import AVFAudio
import UIKit
class APIServices{
    static let placeClient = GMSPlacesClient()
    
    class  func createRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        let token = UserDefaults.standard.string(forKey:AppDefault.accessToken) ?? ""
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    class func pretty_function(_ file: String = #file, function: String = #function, line: Int = #line) {
        
        let fileString: NSString = NSString(string: file)
        if Thread.isMainThread {
            print("file:\(fileString.lastPathComponent) function:\(function) line:\(line) [M]")
        } else {
            print("file:\(fileString.lastPathComponent) function:\(function) line:\(line) [T]")
        }
    }
    
    class func login(email:String, password:String,completion:@escaping(APIResult<Userdata>)->Void){
        Provider.services.request(.login(email: email, password: password)) { result in
            do{
             
                let user: Userdata = try result.decoded()
            
                    AppDefault.user = user.record
                AppDefault.accessToken = user.token ?? ""
//                AppDefault.userId = user.id
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func dashobard(date_to: String,student_id: String, rolename: String,date_from: String,completion:@escaping(APIResult<DashbaordModel>)->Void){
        Provider.services.request(.Dashboard(date_to: date_to, student_id: student_id,rolename: rolename, date_from: date_from)) { result in
            do{
             
                let user: DashbaordModel = try result.decoded()
                
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func Profile(student_id: String,completion:@escaping(APIResult<StudentProfileModel>)->Void){
        Provider.services.request(.Profile(student_id: student_id)) { result in
            do{
             
                let user: StudentProfileModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func Fees(student_id: String,completion:@escaping(APIResult<StudentFeesModel>)->Void){
        Provider.services.request(.Fees(student_id: student_id)) { result in
            do{
             
                let user: StudentFeesModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func HomeWorkApi(student_id: String,completion:@escaping(APIResult<HomeWorkModel>)->Void){
        Provider.services.request(.HomeWorkApi(student_id: student_id)) { result in
            do{
             
                let user: HomeWorkModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func ExaminationApi(student_id: String,completion:@escaping(APIResult<[Exammination]>)->Void){
        Provider.services.request(.ExaminationApi(student_id: student_id)) { result in
            do{
             
                let user: [Exammination] = try result.decoded(keypath: "examSchedule")
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func NoticeBoardApi(student_id: String,completion:@escaping(APIResult<NoticeModel>)->Void){
        Provider.services.request(.NoticeBoardApi(student_id: student_id)) { result in
            do{
             
                let user: NoticeModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func AboutSchoolApi(completion:@escaping(APIResult<AboutSchoolModel>)->Void){
        Provider.services.request(.AboutSchoolApi) { result in
            do{
             
                let user: AboutSchoolModel = try result.decoded()
            
               
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }

    class func HostelsListApi(completion:@escaping(APIResult<HostelsModel>)->Void){
        Provider.services.request(.HostelsListApi) { result in
            do{
             
                let user: HostelsModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func BusRoutsApi(completion:@escaping(APIResult<TransportRouteModel>)->Void){
        Provider.services.request(.BusRouteApi) { result in
            do{
             
                let user: TransportRouteModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func LibraryBooksApi(completion:@escaping(APIResult<LibraryBooksModel>)->Void){
        Provider.services.request(.LibraryBooksApi) { result in
            do{
             
                let user: LibraryBooksModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func SyllabusStatusApi(student_id:String , completion:@escaping(APIResult<SyllabusStatusModel>)->Void){
        Provider.services.request(.SyllabusStatusApi(student_id: student_id)) { result in
            do{
             
                let user: SyllabusStatusModel = try result.decoded()
            
               
                
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func TimeTableApi(student_id:String , completion:@escaping(APIResult<TimeTableModel>)->Void){
        Provider.services.request(.TimeTableApi(student_id: student_id)) { result in
            do{
             
                let user: TimeTableModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func ReturnedBooksApi(student_id:String , completion:@escaping(APIResult<LibraryReturnedBooksModel>)->Void){
        Provider.services.request(.ReturnedBooksApi(studentId: student_id)) { result in
            do{
             
                let user: LibraryReturnedBooksModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func TimeLineApi(student_id:String , completion:@escaping(APIResult<TimelineModel>)->Void){
        Provider.services.request(.TimeLineApi(studentId: student_id)) { result in
            do{
             
                let user: TimelineModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func HostelsDetailsApi(hostelId:String, student_id:String , completion:@escaping(APIResult<HostelFullDetailsModel>)->Void){
        Provider.services.request(.HostelsDetailsApi(hostelId: hostelId,student_id: student_id)) { result in
            do{
             
                let user: HostelFullDetailsModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
//    class func onlineresultexamApi(onlineexam_student_id:String,exam_id:String , completion:@escaping(APIResult<Onlineexamresultmodel>)->Void){
//        Provider.services.request(.onlineexamresultApi(onlineexam_student_id: onlineexam_student_id,exam_id: exam_id)) { result in
//            do{
//
//                let user: Onlineexamresultmodel = try result.decoded()
//
//
//
//                completion(.success(user))
//            }catch{
//                print("-----Error------ \n",error)
//                completion(.failure(error.customDescription))
//            }
//        }
//    }
    class func ExamScheduleApi(exam_group_class_batch_exam_id:String , completion:@escaping(APIResult<ExamScheduleModel>)->Void){
        Provider.services.request(.ExamScheduleApi(exam_group_class_batch_exam_id: exam_group_class_batch_exam_id)) { result in
            do{
             
                let user: ExamScheduleModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func ExamResultsApi(exam_group_class_batch_exam_id:String,student_id:String , completion:@escaping(APIResult<ExamResultModel>)->Void){
        Provider.services.request(.ExamResultsApi(exam_group_class_batch_exam_id: exam_group_class_batch_exam_id,student_id: student_id)) { result in
            do{
             
                let user: ExamResultModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func lessontopicApi(subject_group_subject_id:String,subject_group_class_sections_id:String , completion:@escaping(APIResult<[LessontopicModelElement]>)->Void){
        Provider.services.request(.lessontopicApi(subject_group_subject_id: subject_group_subject_id,subject_group_class_sections_id: subject_group_class_sections_id)) { result in
            do{
             
                let user: [LessontopicModelElement] = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func AssignmentsApi(tag:String,sectionId:String,classId:String , completion:@escaping(APIResult<AssignmentModel>)->Void){
        Provider.services.request(.AssignmentsApi(tag: tag,sectionId: sectionId,classId:classId)) { result in
            do{
             
                let user: AssignmentModel = try result.decoded()
            
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func StudyMaterialApi(tag:String,sectionId:String,classId:String , completion:@escaping(APIResult<StudyMterialModel>)->Void){
        Provider.services.request(.StudyMaterialApi(tag: tag,sectionId: sectionId,classId:classId)) { result in
            do{
             
                let user: StudyMterialModel = try result.decoded()
            // change the model name
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func DownloadSyllabusApi(tag:String,sectionId:String,classId:String , completion:@escaping(APIResult<DownloadSyllabusModel>)->Void){
        Provider.services.request(.DownloadSyllabusApi(tag: tag,sectionId: sectionId,classId:classId)) { result in
            do{
             
                let user: DownloadSyllabusModel = try result.decoded()
                // change the model name
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func DownloadOthersApi(tag:String,sectionId:String,classId:String , completion:@escaping(APIResult<OthersModel1>)->Void){
        Provider.services.request(.DownloadOthersApi(tag: tag,sectionId: sectionId,classId:classId)) { result in
            do{
             
                let user: OthersModel1 = try result.decoded()
                
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func GetTaskApi(user_id:String , completion:@escaping(APIResult<GetTaskModel>)->Void){
        Provider.services.request(.GetTaskApi(user_id: user_id)) { result in
            do{
             
                let user: GetTaskModel = try result.decoded()
                
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func CreateTaskApi(user_id:String,date:String,event_title:String , completion:@escaping(APIResult<CreateTaskModel>)->Void){
        Provider.services.request(.CreateTaskApi(user_id: user_id,date: date,event_title: event_title)) { result in
            do{
             
                let user: CreateTaskModel = try result.decoded()
                
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func UpdateTaskApi(status:String,task_id:String , completion:@escaping(APIResult<UpdateTaskModel>)->Void){
        Provider.services.request(.UpdateTaskApi(status: status,task_id: task_id)) { result in
            do{
             
                let user: UpdateTaskModel = try result.decoded()
                
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func ChildListApi(user:String,parent_id:String , completion:@escaping(APIResult<ChildsListModel>)->Void){
        Provider.services.request(.ChildsListApi(user: user,parent_id: parent_id)) { result in
            do{
             
                let user: ChildsListModel = try result.decoded()
                
             
           
                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func AttendenceApi(date:String,year:String,student_id:String,month:String , completion:@escaping(APIResult<AttendenceModel>)->Void){
        Provider.services.request(.AttendenceApi(date: date,year: year,student_id: student_id,month: month)) { result in
            do{

                let user: AttendenceModel = try result.decoded()



                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func LessonPlanWeeklyApi(date_to:String,student_id:String,date_from:String, completion:@escaping(APIResult<LessonPlanWeeklyModel>)->Void){
        Provider.services.request(.LessonPlanWeeklyApi(date_to: date_to,student_id: student_id,date_from: date_from)) { result in
            do{

                let user: LessonPlanWeeklyModel = try result.decoded()



                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
    class func LessonPlanDataPresentationApi(subject_syllabus_id:String,subjectid:String, completion:@escaping(APIResult<LessonPlanDataPresentationModel>)->Void){
        Provider.services.request(.LessonPlanPresentationDataApi(subject_syllabus_id: subject_syllabus_id,subjectid: subjectid)) { result in
            do{

                let user: LessonPlanDataPresentationModel = try result.decoded()



                completion(.success(user))
            }catch{
                print("-----Error------ \n",error)
                completion(.failure(error.customDescription))
            }
        }
    }
}

