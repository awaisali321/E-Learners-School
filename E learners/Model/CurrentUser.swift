//
//  LoginResponse.swift
//  RGB
//
//  Created by Usama on 20/11/2021.
//


//   var loginResponse = try? newJSONDecoder().decode(LoginResponse.self, from: jsonData)

import Foundation



// MARK: - UserData

struct Userdata: Codable {
    let status: Int?
    let message, id, token, role: String?
    var record: CurrentUser?
}

// MARK: - Record
struct CurrentUser: Codable {
    let id, role, username: String?
    var studentID: String?
    let recordClass, section, dateFormat, currencySymbol: String?
    let timezone, schName: String?
    let language: Language?
    var image: String?
    let isRTL, theme, startWeek: String?
    let parent_childs: [ParentChildList]?

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
        case parent_childs = "parent_childs"
    }
    public static var shared: CurrentUser!
    
}

// MARK: - Language
struct Language: Codable {
    let langID, language: String?

    enum CodingKeys: String, CodingKey {
        case langID = "lang_id"
        case language
    }
}


struct ParentChildList: Codable {
   
    let student_id: String?
    let classes: String?
    let section: String?
    let class_id: String?
    let section_id: String?
    let name: String?
    let image: String?
    
    
    enum CodingKeys: String, CodingKey {
        case classes = "class"
        case student_id
   
        case section
        case class_id
        case section_id
        case name
        case image
       
    }
}



// MARK: - Dashboard


struct DashbaordModel: Codable {
    let attendenceType, classID, sectionID: String?
    let studentAttendencePercentage, studentHomeworkIncomplete, studentIncompleteTask: Int?
    let publicEvents: [String]?
    let dateLists: String?

    enum CodingKeys: String, CodingKey {
        case attendenceType = "attendence_type"
        case classID = "class_id"
        case sectionID = "section_id"
        case studentAttendencePercentage = "student_attendence_percentage"
        case studentHomeworkIncomplete = "student_homework_incomplete"
        case studentIncompleteTask = "student_incomplete_task"
        case publicEvents = "public_events"
        case dateLists = "date_lists"
    }
   
}



// MARK: - StudentProfileModel
struct StudentProfileModel: Codable {
let StudentResult: [studentResult]?
    let studentFields: StudentFields?
    let customFields: CustomFields?

    enum CodingKeys: String, CodingKey {
        case StudentResult = "student_result"
        case studentFields = "student_fields"
        case customFields = "custom_fields"
    }
}

// MARK: - CustomFields
struct studentResult: Codable {
    let  transport_fees: String?
    let  vehroute_id: String?
    let  route_id: String?
    let  vehicle_id: String?
    let  route_titlevehicle_no: String?
    let  room_no: String?
    let  driver_name: String?
    let  driver_contact: String?
    let  hostel_id: String?
    let  hostel_name: String?
    let  room_type_id: String?
    let  room_type: String?
    let  hostel_room_id: String?
    let  student_session_id: String?
    let  fees_discount: String?
    let  class_id: String?
    let  classs: String?
    let  section_id: String?
    let  section: String?
    let  id: String?
    let  admission_no: String?
    let  roll_no: String?
    let  admission_date: String?
    let  firstname: String?
    let  middlename: String?
    let  lastname: String?
    let  image: String?
    let  mobileno: String?
    let  email: String?
    let  state: String?
    let  City: String?
    let  pincode: String?
    let  religion: String?
    let  cast: String?
    let  house_name: String?
    let  dob: String?
    let  current_address: String?
    let  previous_school: String?
    let  guardian_is: String?
    let  parent_id: String?
    let  permanent_address: String?
    let  category_id: String?
    let  adhar_no: String?
    let  samagra_id: String?
    let  bank_account_no: String?
    let  bank_name: String?
    let  ifsc_code: String?
    let  guardian_name: String?
    let  father_pic: String?
    let  height: String?
    let  weight: String?
    let  measurement_date: String?
    let  mother_pic: String?
    let  guardian_pic: String?
    let  guardian_relation: String?
    let  guardian_phone: String?
    let  guardian_address: String?
    let  is_active: String?
    let  father_name: String?
    let  father_phone: String?
    let  blood_group: String?
    let  school_house_id: String?
    let  father_occupation: String?
    let  mother_name: String?
    let  mother_phone: String?
    let  mother_occupation: String?
    let  guardian_occupation: String?
    let  gender: String?
    let  rte: String?
    let  route_title: String?
    let  vehicle_no: String?
    let  guardian_email: String?
    let  category: String?
    let  created_at: String?
    let  updated_at: String?
    let  MedicalHistory: String?
    let  FatherCNIC: String?
    let  Nationality: String?
    let  Domicile: String?
    let  Student_CNIC_no: String?
    let  Medical_fitness: String?
    let  Any_disability: String?
    let  FSc_Marks: String?
    let  MDCAT_Marks: String?
    let  Matric_Marks: String?
    
    
    

    enum CodingKeys: String, CodingKey {
        case transport_fees = "transport_fees"
        case vehroute_id = "vehroute_id"
        case route_id = "route_id"
        case vehicle_id = "vehicle_id"
        case route_titlevehicle_no = "route_titlevehicle_no"
        case room_no = "room_no"
        case driver_name = "driver_name"
        case driver_contact = "driver_contact"
        case hostel_id = "hostel_id"
        case hostel_name = "hostel_name"
        case room_type_id = "room_type_id"
        case room_type = "room_type"
        case hostel_room_id = "hostel_room_id"
        case student_session_id = "student_session_id"
        case fees_discount = "fees_discount"
        case class_id = "class_id"
        case classs = "class"
        case section_id = "section_id"
        case section = "section"
        case id = "id"
        case admission_no = "admission_no"
        case roll_no = "roll_no"
        case admission_date = "admission_date"
        case firstname = "firstname"
        case middlename = "middlename"
        case lastname = "lastname"
        case image = "image"
        case mobileno = "mobileno"
        case email = "email"
        case state = "state"
        case City = "City"
        case pincode = "pincode"
        case religion = "religion"
        case cast = "cast"
        case house_name = "house_name"
        case dob = "dob"
        case current_address = "current_address"
        case previous_school = "previous_school"
        case guardian_is = "guardian_is"
        case parent_id = "parent_id"
        case permanent_address = "permanent_address"
        case category_id = "category_id"
        case adhar_no = "adhar_no"
        case samagra_id = "samagra_id"
        case bank_account_no = "bank_account_no"
        case bank_name = "bank_name"
        case ifsc_code = "ifsc_code"
        case guardian_name = "guardian_name"
        case father_pic = "father_pic"
        case height = "height"
        case weight = "weight"
        case measurement_date = "measurement_date"
        case mother_pic = "mother_pic"
        case guardian_pic = "guardian_pic"
        case guardian_relation = "guardian_relation"
        case guardian_phone = "guardian_phone"
        case guardian_address = "guardian_address"
        case is_active = "is_active"
        case father_name = "father_name"
        case father_phone = "father_phone"
        case blood_group = "blood_group"
        case school_house_id = "school_house_id"
        case father_occupation = "father_occupation"
        case mother_name = "mother_name"
        case mother_phone = "mother_phone"
        case mother_occupation = "mother_occupation"
        case guardian_occupation = "guardian_occupation"
        case gender = "gender"
        case rte = "rte"
        case guardian_email = "guardian_email"
        case category = "category"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case MedicalHistory = "MedicalHistory"
        case FatherCNIC = "FatherCNIC"
        case Nationality = "Nationality"
        case Domicile = "Domicile"
        case Student_CNIC_no = "Student CNIC no"
        case Medical_fitness = "Medical fitness"
        case Any_disability = "Any disability"
        case FSc_Marks = "FSc Marks"
        case MDCAT_Marks = "MDCAT Marks"
        case Matric_Marks = "Matric Marks"
        case vehicle_no = "vehicle_no"
        case route_title = "route_title"
        
        
    }
}

// MARK: - StudentFields
struct StudentFields: Codable {
    let bloodGroup: Int?
    let studentHouse, rollNo, category, religion: Int?
    let mobileNo, studentEmail, admissionDate, lastname: Int?
    let studentPhoto, studentHeight, studentWeight, fatherName: Int?
    let fatherPhone, fatherOccupation, fatherPic, motherName: Int?
    let motherPhone, motherOccupation, motherPic, guardianRelation: Int?
    let guardianEmail, guardianPic, guardianAddress, currentAddress: Int?
    let permanentAddress, routeList, hostelID, bankAccountNo: Int?
    let nationalIdentificationNo, localIdentificationNo, previousSchool, guardianName: Int?
    let guardianPhone, guardianOccupation, bankName, ifscCode: Int?

    enum CodingKeys: String, CodingKey {
        case bloodGroup = "blood_group"
        case studentHouse = "student_house"
        case rollNo = "roll_no"
        case category, religion
        case mobileNo = "mobile_no"
        case studentEmail = "student_email"
        case admissionDate = "admission_date"
        case lastname
        case studentPhoto = "student_photo"
        case studentHeight = "student_height"
        case studentWeight = "student_weight"
        case fatherName = "father_name"
        case fatherPhone = "father_phone"
        case fatherOccupation = "father_occupation"
        case fatherPic = "father_pic"
        case motherName = "mother_name"
        case motherPhone = "mother_phone"
        case motherOccupation = "mother_occupation"
        case motherPic = "mother_pic"
        case guardianRelation = "guardian_relation"
        case guardianEmail = "guardian_email"
        case guardianPic = "guardian_pic"
        case guardianAddress = "guardian_address"
        case currentAddress = "current_address"
        case permanentAddress = "permanent_address"
        case routeList = "route_list"
        case hostelID = "hostel_id"
        case bankAccountNo = "bank_account_no"
        case nationalIdentificationNo = "national_identification_no"
        case localIdentificationNo = "local_identification_no"
        case previousSchool = "previous_school"
        case guardianName = "guardian_name"
        case guardianPhone = "guardian_phone"
        case guardianOccupation = "guardian_occupation"
        case bankName = "bank_name"
        case ifscCode = "ifsc_code"
    }
  
}


// MARK: - CustomFields
struct CustomFields: Codable {
    let medicalHistory, fatherCNIC: [String]?

    enum CodingKeys: String, CodingKey {
        case medicalHistory = "Medical History"
        case fatherCNIC = "Father CNIC"

    }
}

// MARK: - StudentFeesModel
struct StudentFeesModel: Codable {
    let payMethod: Int?
    let studentDueFee: [StudentDueFee]?
    let studentDiscountFee: [StudentDiscountFee]?
    let grandFee: GrandFee?

    enum CodingKeys: String, CodingKey {
        case payMethod = "pay_method"
        case studentDueFee = "student_due_fee"
        case studentDiscountFee = "student_discount_fee"
        case grandFee = "grand_fee"
    }
}

// MARK: - GrandFee
struct GrandFee: Codable {
    let amount, amountDiscount, amountFine, amountPaid: String?
    let amountRemaining: String?
    let feeFine: Int?

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case amountDiscount = "amount_discount"
        case amountFine = "amount_fine"
        case amountPaid = "amount_paid"
        case amountRemaining = "amount_remaining"
        case feeFine = "fee_fine"
    }
}

// MARK: - StudentDiscountFee
struct StudentDiscountFee: Codable {
    let id, studentSessionID, status, paymentID: String?
    let studentFeesDiscountDescription, feesDiscountID, name, code: String?
    let amount, description, sessionID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case studentSessionID = "student_session_id"
        case status
        case paymentID = "payment_id"
        case studentFeesDiscountDescription = "student_fees_discount_description"
        case feesDiscountID = "fees_discount_id"
        case name, code, amount, description
        case sessionID = "session_id"
    }
}

// MARK: - StudentDueFee
struct StudentDueFee: Codable {
    let id, isSystem, studentSessionID, feeSessionGroupID: String?
    let amount, isActive, createdAt, name: String?
    let fees: [Fee]?

    enum CodingKeys: String, CodingKey {
        case id
        case isSystem = "is_system"
        case studentSessionID = "student_session_id"
        case feeSessionGroupID = "fee_session_group_id"
        case amount
        case isActive = "is_active"
        case createdAt = "created_at"
        case name, fees
    }
}

// MARK: - Fee
struct Fee: Codable {
    let id, isSystem, studentSessionID, feeSessionGroupID: String?
    let amount, isActive, createdAt, feeGroupsFeetypeID: String?
    let fineAmount, dueDate, feeGroupsID, name: String?
    let feetypeID, code, type, studentFeesDepositeID: String?
    let amountDetail, totalAmountPaid, totalAmountDiscount, totalAmountFine: String?
    let totalAmountDisplay, totalAmountRemaining, status, feesFineAmount: String?

    enum CodingKeys: String, CodingKey {
        case id
        case isSystem = "is_system"
        case studentSessionID = "student_session_id"
        case feeSessionGroupID = "fee_session_group_id"
        case amount
        case isActive = "is_active"
        case createdAt = "created_at"
        case feeGroupsFeetypeID = "fee_groups_feetype_id"
        case fineAmount = "fine_amount"
        case dueDate = "due_date"
        case feeGroupsID = "fee_groups_id"
        case name
        case feetypeID = "feetype_id"
        case code, type
        case studentFeesDepositeID = "student_fees_deposite_id"
        case amountDetail = "amount_detail"
        case totalAmountPaid = "total_amount_paid"
        case totalAmountDiscount = "total_amount_discount"
        case totalAmountFine = "total_amount_fine"
        case totalAmountDisplay = "total_amount_display"
        case totalAmountRemaining = "total_amount_remaining"
        case status
        case feesFineAmount = "fees_fine_amount"
    }
}
// MARK: - HomeWorkModel
struct HomeWorkModel: Codable {
    let homeworklist: [Homeworklist]?
    let classID, sectionID, subjectID: String?

    enum CodingKeys: String, CodingKey {
        case homeworklist
        case classID = "class_id"
        case sectionID = "section_id"
        case subjectID = "subject_id"
    }
}

// MARK: - Homeworklist
struct Homeworklist: Codable {
    let id, classID, sectionID, sessionID: String?
    let homeworkDate, submitDate, staffID, subjectGroupSubjectID: String?
    let subjectID, description, createDate, evaluationDate: String?
    let document, createdBy, evaluatedBy, name: String?
    let section, homeworklistClass, staffCreated, staffEvaluated: String?
    let homeworkEvaluationID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case classID = "class_id"
        case sectionID = "section_id"
        case sessionID = "session_id"
        case homeworkDate = "homework_date"
        case submitDate = "submit_date"
        case staffID = "staff_id"
        case subjectGroupSubjectID = "subject_group_subject_id"
        case subjectID = "subject_id"
        case description
        case createDate = "create_date"
        case evaluationDate = "evaluation_date"
        case document
        case createdBy = "created_by"
        case evaluatedBy = "evaluated_by"
        case name, section
        case homeworklistClass = "class"
        case staffCreated = "staff_created"
        case staffEvaluated = "staff_evaluated"
        case homeworkEvaluationID = "homework_evaluation_id"
    }
}
// MARK: - NoticeModel
struct NoticeModel: Codable {
    let success: Int?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let id, title, publishDate, date: String?
    let message, visibleStudent, visibleStaff, visibleParent: String?
    let createdBy, createdID, isActive, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case publishDate = "publish_date"
        case date, message
        case visibleStudent = "visible_student"
        case visibleStaff = "visible_staff"
        case visibleParent = "visible_parent"
        case createdBy = "created_by"
        case createdID = "created_id"
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}




// MARK: - EXAMINATION
struct Exammination: Codable {
    let id, examGroupClassBatchExamID, studentID, studentSessionID: String?
    let rollNo: String?
    let teacherRemark: String?
    let isActive, createdAt: String?
    let updatedAt: String?
    let exam, examActive, resultPublish: String?

    enum CodingKeys: String, CodingKey {
        case id
        case examGroupClassBatchExamID = "exam_group_class_batch_exam_id"
        case studentID = "student_id"
        case studentSessionID = "student_session_id"
        case rollNo = "roll_no"
        case teacherRemark = "teacher_remark"
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case exam
        case examActive = "exam_active"
        case resultPublish = "result_publish"
    }
}

// MARK: - AboutSchoolModel
struct AboutSchoolModel: Codable {
    let name, diseCode, email, phone: String?
    let address, startMonth, image, session: String?
    let startMonthName: String?

    enum CodingKeys: String, CodingKey {
        case name
        case diseCode = "dise_code"
        case email, phone, address
        case startMonth = "start_month"
        case image, session
        case startMonthName = "start_month_name"
    }
}

// MARK: - HostelsModel
struct HostelsModel: Codable {
    let success: Int?
    let data: [hosteldetails]?
}

// MARK: - Datum
struct hosteldetails: Codable {
    let id, hostelName, type: String?

    enum CodingKeys: String, CodingKey {
        case id
        case hostelName = "hostel_name"
        case type
    }
}
// MARK: - HostelDetailsModel
struct HostelFullDetailsModel: Codable {
    let success: Int?
    let data: [Datum1]?
}

// MARK: - Datum
struct Datum1: Codable {
    let id, hostelID, roomTypeID, roomNo: String?
    let noOfBed, costPerBed: String?
    let title: String?
    let description, createdAt: String?
    let updatedAt: String?
    let roomType, studentID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case hostelID = "hostel_id"
        case roomTypeID = "room_type_id"
        case roomNo = "room_no"
        case noOfBed = "no_of_bed"
        case costPerBed = "cost_per_bed"
        case title, description
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case roomType = "room_type"
        case studentID = "student_id"
    }
}

// MARK: - TransportRouteModelElement
struct TransportRouteModelElement: Codable {
    let id, routeTitle: String?
    let noOfVehicle: String?
    let fare: String?
    let note: String?
    let isActive, createdAt: String?
    let updatedAt: String?
    let vehicles: [Vehicle]?

    enum CodingKeys: String, CodingKey {
        case id
        case routeTitle = "route_title"
        case noOfVehicle = "no_of_vehicle"
        case fare, note
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case vehicles
    }
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let vecRouteID, id, vehicleNo, vehicleModel: String?
    let manufactureYear, driverName, driverLicence, driverContact: String?
    let note, createdAt: String?

    enum CodingKeys: String, CodingKey {
        case vecRouteID = "vec_route_id"
        case id
        case vehicleNo = "vehicle_no"
        case vehicleModel = "vehicle_model"
        case manufactureYear = "manufacture_year"
        case driverName = "driver_name"
        case driverLicence = "driver_licence"
        case driverContact = "driver_contact"
        case note
        case createdAt = "created_at"
    }
}

typealias TransportRouteModel = [TransportRouteModelElement]

// MARK: - LibraryBooksModel
struct LibraryBooksModel: Codable {
    let success: Int?
    let data: [LibraryBooksData]?
}

// MARK: - Datum
struct LibraryBooksData: Codable {
    let id, bookTitle, bookNo, isbnNo: String?
    let subject, rackNo, publish, author: String?
    let qty, perunitcost, postdate, description: String?
    let available, isActive, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case bookTitle = "book_title"
        case bookNo = "book_no"
        case isbnNo = "isbn_no"
        case subject
        case rackNo = "rack_no"
        case publish, author, qty, perunitcost, postdate, description, available
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - LibraryReturnedBooksModelElement
struct LibraryReturnedBooksModelElement: Codable {
    let returnDate: String?
    let dueReturnDate, bookNo, issueDate, isReturned: String?
    let bookTitle, author, subject: String?

    enum CodingKeys: String, CodingKey {
        case returnDate = "return_date"
        case dueReturnDate = "due_return_date"
        case bookNo = "book_no"
        case issueDate = "issue_date"
        case isReturned = "is_returned"
        case bookTitle = "book_title"
        case author, subject
    }
}

typealias LibraryReturnedBooksModel = [LibraryReturnedBooksModelElement]




// MARK: - SyllabusStatusModel
struct SyllabusStatusModel: Codable {
    let subjects: [Subject]?
}

// MARK: - Subject
struct Subject: Codable {
    let id, subjectGroupID, classSectionID, sessionID: String?
    let description: String?
    let isActive, createdAt: String?
    let updatedAt: String?
    let name, subjectID, subjectGroupSubjectID, subjectName: String?
    let subjectCode, total, totalComplete: String?

    enum CodingKeys: String, CodingKey {
        case id
        case subjectGroupID = "subject_group_id"
        case classSectionID = "class_section_id"
        case sessionID = "session_id"
        case description
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
        case subjectID = "subject_id"
        case subjectGroupSubjectID = "subject_group_subject_id"
        case subjectName = "subject_name"
        case subjectCode = "subject_code"
        case total
        case totalComplete = "total_complete"
    }
}

// MARK: - TimeTableModel
struct TimeTableModel: Codable {
    let timetable: Timetable?
    enum CodingKeys: String, CodingKey {
        case timetable = "timetable"
    }
}





// MARK: - Timetable
struct Timetable: Codable {
    let monday, tuesday, wednesday: [Day]?
    let thursday: [Day]?
    let friday: [Day]?
    let saturday, sunday: [Day]?

    enum CodingKeys: String, CodingKey {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
    }
}

// MARK: - Day
struct Day: Codable {
    let subjectID: String?
    let subjectName: String?
    let code: String?
    let type: String?
    let name, surname, employeeID, id: String?
    let day, classID, sectionID, subjectGroupID: String?
    let subjectGroupSubjectID, staffID, timeFrom, timeTo: String?
    let startTime, endTime, roomNo, sessionID: String?
    let createdAt, subjectGroupClassSectionsID: String?

    enum CodingKeys: String, CodingKey {
        case subjectID = "subject_id"
        case subjectName = "subject_name"
        case code, type, name, surname
        case employeeID = "employee_id"
        case id, day
        case classID = "class_id"
        case sectionID = "section_id"
        case subjectGroupID = "subject_group_id"
        case subjectGroupSubjectID = "subject_group_subject_id"
        case staffID = "staff_id"
        case timeFrom = "time_from"
        case timeTo = "time_to"
        case startTime = "start_time"
        case endTime = "end_time"
        case roomNo = "room_no"
        case sessionID = "session_id"
        case createdAt = "created_at"
        case subjectGroupClassSectionsID = "subject_group_class_sections_id"
    }
}
// MARK: - TimelineModelElement
struct TimelineModelElement: Codable {
    let id, studentID, title, timelineDate: String?
    let description, document, status, date: String?

    enum CodingKeys: String, CodingKey {
        case id
        case studentID = "student_id"
        case title
        case timelineDate = "timeline_date"
        case description, document, status, date
    }
}

typealias TimelineModel = [TimelineModelElement]



// MARK: - Onlineexamresultmodel
struct Onlineexamresultmodel: Codable {
    let result: Results?
    enum CodingKeys: String, CodingKey {
        case result = "result"
        
    }
    
    // MARK: - Result
    struct Results: Codable {
        let questionResult: [String]
        let exam: Exam?
        
        enum CodingKeys: String, CodingKey {
            case questionResult = "question_result"
            case exam
        }
    }
    
    // MARK: - Exam
    struct Exam: Codable {
        let id, exam, attempt, examFrom: String
        let examTo, isQuiz, autoPublishDate: String
        let timeFrom, timeTo: String?
        let duration, passingPercentage, description, sessionID: String
        let publishResult, isActive, isMarksDisplay, isNegMarking: String
        let isRandomQuestion, isRankGenerated, publishExamNotification, publishResultNotification: String
        let createdAt: String
        let updatedAt, rank: String?
        let correctAns, wrongAns, notAttempted, totalQuestion: Int
        let totalDescriptive, examTotalMarks, examTotalNegMarks, examTotalScored: Int
        let score: Int
        
        enum CodingKeys: String, CodingKey {
            case id, exam, attempt
            case examFrom = "exam_from"
            case examTo = "exam_to"
            case isQuiz = "is_quiz"
            case autoPublishDate = "auto_publish_date"
            case timeFrom = "time_from"
            case timeTo = "time_to"
            case duration
            case passingPercentage = "passing_percentage"
            case description
            case sessionID = "session_id"
            case publishResult = "publish_result"
            case isActive = "is_active"
            case isMarksDisplay = "is_marks_display"
            case isNegMarking = "is_neg_marking"
            case isRandomQuestion = "is_random_question"
            case isRankGenerated = "is_rank_generated"
            case publishExamNotification = "publish_exam_notification"
            case publishResultNotification = "publish_result_notification"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case rank
            case correctAns = "correct_ans"
            case wrongAns = "wrong_ans"
            case notAttempted = "not_attempted"
            case totalQuestion = "total_question"
            case totalDescriptive = "total_descriptive"
            case examTotalMarks = "exam_total_marks"
            case examTotalNegMarks = "exam_total_neg_marks"
            case examTotalScored = "exam_total_scored"
            case score
        }
    }
}

// MARK: - ExamScheduleModel
struct ExamScheduleModel: Codable {
    let examSubjects: [ExamSubject]?

    enum CodingKeys: String, CodingKey {
        case examSubjects = "exam_subjects"
    }
}

// MARK: - ExamSubject
struct ExamSubject: Codable {
    let id, examGroupClassBatchExamsID, subjectID, dateFrom: String?
    let timeFrom, duration, roomNo, maxMarks: String?
    let minMarks, creditHours: String?
    let dateTo: String?
    let isActive, createdAt: String?
    let updatedAt: String?
    let subjectName, subjectCode, subjectType: String?

    enum CodingKeys: String, CodingKey {
        case id
        case examGroupClassBatchExamsID = "exam_group_class_batch_exams_id"
        case subjectID = "subject_id"
        case dateFrom = "date_from"
        case timeFrom = "time_from"
        case duration
        case roomNo = "room_no"
        case maxMarks = "max_marks"
        case minMarks = "min_marks"
        case creditHours = "credit_hours"
        case dateTo = "date_to"
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case subjectName = "subject_name"
        case subjectCode = "subject_code"
        case subjectType = "subject_type"
    }
}

// MARK: - ExamResultModel
struct ExamResultModel: Codable {
    let exam: Exam?
    
    enum CodingKeys: String, CodingKey {
        case exam = "exam"
    }
}

// MARK: - Exam
struct Exam: Codable {
    let examGroupClassBatchExamID, examGroupID, exam, examGroup: String?
    let description, examType: String?
    let subjectResult: [SubjectsResults]?
    let totalMaxMarks, totalGetMarks, totalExamPoints, examQualityPoints: Int?
    let examCreditHour: Int?
    let examResultStatus: String?
    let isConsolidate: Int?
    let percentage: Double?
    let division, examGrade: String?

    enum CodingKeys: String, CodingKey {
        case examGroupClassBatchExamID = "exam_group_class_batch_exam_id"
        case examGroupID = "exam_group_id"
        case exam
        case examGroup = "exam_group"
        case description
        case examType = "exam_type"
        case subjectResult = "subject_result"
        case totalMaxMarks = "total_max_marks"
        case totalGetMarks = "total_get_marks"
        case totalExamPoints = "total_exam_points"
        case examQualityPoints = "exam_quality_points"
        case examCreditHour = "exam_credit_hour"
        case examResultStatus = "exam_result_status"
        case isConsolidate = "is_consolidate"
        case percentage
        case division = "division"
        case examGrade = "exam_grade"
    }
}

// MARK: - SubjectResult
struct SubjectsResults: Codable {
    let name, code, examGroupClassBatchExamsID, roomNo: String?
    let maxMarks, minMarks, subjectID, attendence: String?
    let getMarks, examGroupExamResultsID, note, duration: String?
    let creditHours, examGrade: String?

    enum CodingKeys: String, CodingKey {
        case name, code
        case examGroupClassBatchExamsID = "exam_group_class_batch_exams_id"
        case roomNo = "room_no"
        case maxMarks = "max_marks"
        case minMarks = "min_marks"
        case subjectID = "subject_id"
        case attendence
        case getMarks = "get_marks"
        case examGroupExamResultsID = "exam_group_exam_results_id"
        case note, duration
        case creditHours = "credit_hours"
        case examGrade = "exam_grade"
    }
    
}
// MARK: - LessontopicModelElement


struct LessontopicModelElement: Codable {
    let id, sessionID, subjectGroupSubjectID, subjectGroupClassSectionsID: String?
    let name, createdAt, total, totalComplete: String?
    let topics: [Topics]?

    enum CodingKeys: String, CodingKey {
        case id
        case sessionID = "session_id"
        case subjectGroupSubjectID = "subject_group_subject_id"
        case subjectGroupClassSectionsID = "subject_group_class_sections_id"
        case name
        case createdAt = "created_at"
        case total
        case totalComplete = "total_complete"
        case topics 
    }
}

// MARK: - Topic
struct Topics: Codable {
    let id, sessionID, lessonID, name: String?
    let status, completeDate, createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case sessionID = "session_id"
        case lessonID = "lesson_id"
        case name, status
        case completeDate = "complete_date"
        case createdAt = "created_at"
    }
}


// MARK: - AssignmentModel
struct AssignmentModel: Codable {
    let data: [AssignmentsData]?
 
}

// MARK: - Datum
struct AssignmentsData: Codable {
    let id, title, type, isPublic: String?
    let classID, clsSECID, file, createdBy: String?
    let note, isActive, createdAt: String?
    let updatedAt: String?
    let date, classSectionID, datumClass, section: String?

    enum CodingKeys: String, CodingKey {
        case id, title, type
        case isPublic = "is_public"
        case classID = "class_id"
        case clsSECID = "cls_sec_id"
        case file
        case createdBy = "created_by"
        case note
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case date
        case classSectionID = "class_section_id"
        case datumClass = "class"
        case section
    }
}


// MARK: - StudyMterialModel
struct StudyMterialModel: Codable {
    
    let data: [datum3]?
}

// MARK: - Datum
struct datum3: Codable {
    let id, title, type, isPublic: String?
    let classID, clsSECID, file, createdBy: String?
    let note, isActive, createdAt: String?
    let updatedAt: String?
    let date, classSectionID, datumClass, section: String?

    enum CodingKeys: String, CodingKey {
        case id, title, type
        case isPublic = "is_public"
        case classID = "class_id"
        case clsSECID = "cls_sec_id"
        case file
        case createdBy = "created_by"
        case note
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case date
        case classSectionID = "class_section_id"
        case datumClass = "class"
        case section
    }
}

// MARK: - OthersModel
struct OthersModel1: Codable {
    let success: Int?
    let data: [datum4]?
}

// MARK: - Datum
struct datum4: Codable {
    let id, title, type, isPublic: String?
    let classID, clsSECID, file, createdBy: String?
    let note, isActive, createdAt: String?
    let updatedAt: String?
    let date, classSectionID, datumClass, section: String?

    enum CodingKeys: String, CodingKey {
        case id, title, type
        case isPublic = "is_public"
        case classID = "class_id"
        case clsSECID = "cls_sec_id"
        case file
        case createdBy = "created_by"
        case note
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case date
        case classSectionID = "class_section_id"
        case datumClass = "class"
        case section
    }
}


// MARK: - SyllabusModel
struct DownloadSyllabusModel: Codable {
    let success: Int?
    let data: [datum5]?
}

// MARK: - Datum
struct datum5: Codable {
    let id, title, type, isPublic: String?
    let classID, clsSECID, file, createdBy: String?
    let note, isActive, createdAt: String?
    let updatedAt: String?
    let date, classSectionID, datumClass, section: String?

    enum CodingKeys: String, CodingKey {
        case id, title, type
        case isPublic = "is_public"
        case classID = "class_id"
        case clsSECID = "cls_sec_id"
        case file
        case createdBy = "created_by"
        case note
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case date
        case classSectionID = "class_section_id"
        case datumClass = "class"
        case section
    }
}


// MARK: - GetTaskModel
struct GetTaskModel: Codable {
    let tasks: [Task1]?
}

// MARK: - Task
struct Task1: Codable {
    let id, eventTitle, eventDescription, startDate: String?
    let endDate, eventType, eventColor, eventFor: String?
    let roleID, isActive: String?

    enum CodingKeys: String, CodingKey {
        case id
        case eventTitle = "event_title"
        case eventDescription = "event_description"
        case startDate = "start_date"
        case endDate = "end_date"
        case eventType = "event_type"
        case eventColor = "event_color"
        case eventFor = "event_for"
        case roleID = "role_id"
        case isActive = "is_active"
    }
}
// MARK: - CreateTaskModel
struct CreateTaskModel: Codable {
    let status, msg: String?
}
// MARK: - UpdateTaskModel
struct UpdateTaskModel: Codable {
    let status, msg: String?
}
// MARK: - UploadDocumentsModel
struct UploadDocumentsModel: Codable {
    let status, msg: String?
}

// MARK: - ChildsListModel
struct ChildsListModel: Codable {
    let Childs: [childs]?
}

// MARK: - Childs
struct childs: Codable {
    let id: String?
    let parentID,admissionNO,RollNo,AdmissionDate,FirstName,MiddleName,LastName,rte,image:String?
    let mobileNo,Email,State,City,PinCode,Religion,Cast,DOB,Gender,CurrentAdress,PermanentAdress,CategoryID,RouteId,SchoolHouseID,BloodGroup : String?
    let VehicleRouteId,HoustelRoomID,AdhaarNumber,SamagarID,BankAccountNo,BankName,ifscCode,GuardianIS,FatherName:String?
    let FatherPhone,FatherOccupation,MotherName,MotherPhone,MotherOccupation,GuardianName,GuardianRelation,GuardianPhone,GuardianOccupation,GuardianAdress,GuardianEmail,FatherPic,MotherPic,GuardianPic,IsActive,PreviousSchool,Height,Weight,MeasurmentDate,DisReason,Note,DisNote,AppKey,ParentAppKey,DisableAt,CreatedAt,updatedAt,FtherCnic,ClassID,Class,SectionID,Section:String?


    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parent_id"
        case admissionNO = "admission_no"
        case RollNo = "roll_no"
        case AdmissionDate = "admission_date"
        case FirstName = "firstname"
        case MiddleName = "middlename"
        case LastName = "lastname"
        case rte = "rte"
        case image = "image"
        case mobileNo = "mobileno"
        case Email = "email"
        case State = "state"
        case City = "city"
        case PinCode = "pincode"
        case Religion = "religion"
        case Cast = "cast"
        case DOB = "dob"
        case Gender = "gender"
        case CurrentAdress = "current_address"
        case PermanentAdress = "permanent_address"
        case CategoryID = "category_id"
        case RouteId = "route_id"
        case SchoolHouseID = "school_house_id"
        case BloodGroup = "blood_group"
        case VehicleRouteId = "vehroute_id"
        case HoustelRoomID = "hostel_room_id"
        case AdhaarNumber = "adhar_no"
        case SamagarID = "samagra_id"
        case BankAccountNo = "bank_account_no"
        case BankName = "bank_name"
        case ifscCode = "ifsc_code"
        case GuardianIS = "guardian_is"
        case FatherName = "father_name"
        case FatherPhone = "father_phone"
        case FatherOccupation = "father_occupation"
        case MotherName = "mother_name"
        case MotherPhone = "mother_phone"
        case MotherOccupation = "mother_occupation"
        case GuardianName = "guardian_name"
        case GuardianRelation = "guardian_relation"
        case GuardianPhone = "guardian_phone"
        case GuardianOccupation = "guardian_occupation"
        case GuardianAdress = "guardian_address"
        case GuardianEmail = "guardian_email"
        case FatherPic = "father_pic"
        case MotherPic = "mother_pic"
        case GuardianPic = "guardian_pic"
        case IsActive = "is_active"
        case PreviousSchool = "previous_school"
        case Height = "height"
        case Weight = "weight"
        case MeasurmentDate = "measurement_date"
        case DisReason = "dis_reason"
        case Note = "note"
        case DisNote = "dis_note"
        case AppKey = "app_key"
        case ParentAppKey = "parent_app_key"
        case DisableAt = "disable_at"
        case CreatedAt = "created_at"
        case updatedAt = "updated_at"
        case FtherCnic = "father_cnic"
        case ClassID = "class_id"
        case Class = "class"
        case SectionID = "section_id"
        case Section = "section"
        
    }
}
// MARK: - AttendenceModel
struct AttendenceModel: Codable {
    let attendecetype:String?
    let data: [datem]?
    enum CodingKeys: String, CodingKey {
        case attendecetype = "attendence_type"
        case data
    }
}
// MARK: - Attendence
struct datem: Codable {
    let date: String?
    let type: String?
  
    enum CodingKeys: String, CodingKey {
        case date
        case type
    }
}

// MARK: - LessonPlanWeeklyModel
struct LessonPlanWeeklyModel: Codable {
    let timetable: Timetable1?
    let status: String?
}

// MARK: - Timetable
struct Timetable1: Codable {
    let monday, tuesday, wednesday: [Days]?
    let thursday: [Days]?
    let friday: [Days]?

    enum CodingKeys: String, CodingKey {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
    }
}

// MARK: - Day
struct Days: Codable {
    let subjectSyllabusID, timeFrom, timeTo, id: String?
    let subjectGroupID, classSectionID, sessionID: String?
    let description: String?
    let isActive, createdAt: String?
    let updatedAt: String?
    let dayClass, section, lessonID, topicName: String?
    let lessonName, date, name, code: String?

    enum CodingKeys: String, CodingKey {
        case subjectSyllabusID = "subject_syllabus_id"
        case timeFrom = "time_from"
        case timeTo = "time_to"
        case id
        case subjectGroupID = "subject_group_id"
        case classSectionID = "class_section_id"
        case sessionID = "session_id"
        case description
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case dayClass = "class"
        case section
        case lessonID = "lesson_id"
        case topicName = "topic_name"
        case lessonName = "lesson_name"
        case date, name, code
    }
}


// MARK: - LessonPlanDataModel
struct LessonPlanDataPresentationModel: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, topicID, sessionID, createdBy: String?
    let createdFor, date, timeFrom, timeTo: String?
    let presentation, attachment: String?
    let lactureYoutubeURL: String?
    let lactureVideo, subTopic, teachingMethod, generalObjectives: String?
    let previousKnowledge, comprehensiveQuestions, status, createdAt: String?
    let topicName, lessonName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case topicID = "topic_id"
        case sessionID = "session_id"
        case createdBy = "created_by"
        case createdFor = "created_for"
        case date
        case timeFrom = "time_from"
        case timeTo = "time_to"
        case presentation, attachment
        case lactureYoutubeURL = "lacture_youtube_url"
        case lactureVideo = "lacture_video"
        case subTopic = "sub_topic"
        case teachingMethod = "teaching_method"
        case generalObjectives = "general_objectives"
        case previousKnowledge = "previous_knowledge"
        case comprehensiveQuestions = "comprehensive_questions"
        case status
        case createdAt = "created_at"
        case topicName = "topic_name"
        case lessonName = "lesson_name"
    }
}
