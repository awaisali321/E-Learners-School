//
//  AppDelegate.swift
//  E learners
//
//  Created by qaiser on 31/03/2023.
//

import UIKit
import IQKeyboardManagerSwift
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var dashboardmodelArray:DashbaordModel? = nil
    var lessonplanModels:Days? = nil
    var lessonplanPresentationModels:LessonPlanDataPresentationModel? = nil
    
    var window: UIWindow?

    let imagebaseurl = "https://watim.elearners.com.pk/"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
                IQKeyboardManager.shared.shouldResignOnTouchOutside = true
                IQKeyboardManager.shared.shouldPlayInputClicks = true
                IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
                IQKeyboardManager.shared.enableDebugging = true
        if UserDefaults.standard.object(forKey: "islogin") as? Bool ?? false == false{
            self.gotoSignInVc()
        }else {
            self.GotoDashBoard()
        }
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func gotoSignInVc(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                
                        if let stView = storyboard.instantiateViewController(withIdentifier: "LogInVC") as? LogInVC {
                         
                            stView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                            let navigationController = UINavigationController(rootViewController: stView)
                            navigationController.isNavigationBarHidden = true
                            self.window?.rootViewController = navigationController
                            self.window?.makeKeyAndVisible()
                            
                        }
    }
    func GotoDashBoard(){
        let loginclass = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuVCBase") as!MenuVCBase
        let navController = UINavigationController(rootViewController: loginclass) // Integrate navigation controller programmatically if you want
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
//        appdelegate.window?.rootViewController = navController
//        UIApplication.shared.windows.first?.rootViewController = navController
//        UIApplication.shared.windows.first?.makeKeyAndVisible()

        navController.isNavigationBarHidden = true
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        
    }

//    func setdate(setdate:String,format:String)->String{
//        
//        
//        
//        
//  
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//       
//        formatter.timeZone = TimeZone(abbreviation: appdelegate.timezone)
//        
//        
////
////        let formatter = DateFormatter()
////
////        formatter.dateFormat = "yyyy-MM-ddTHH:mm:ss.SSS ZZZZ"
//        let result = formatter.date(from: setdate) ?? Date()
//        
//        let formatter2 = DateFormatter()
//        formatter2.dateFormat = format
//        let result3 = formatter2.string(from: result)
//        
//
//        return result3
//        
//    }
    
    
  
    
//    func setdateappointment(setdate:String,format:String)->String{
//
//
//        self.myUser = User.readUserFromArchive()
//
//        let usertimezone = self.myUser?[0].timezone ?? ""
//
//
//
//
//
//
//
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
//        formatter.timeZone =  TimeZone(abbreviation: "UTC")
//        var calendar = Calendar(identifier: .gregorian)
//        let dateInGrogrian = formatter.date(from: setdate)!
//        let date = dateInGrogrian
//        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
//        calendar.timeZone = TimeZone(abbreviation: usertimezone) ?? TimeZone.current
//        let finalDate = calendar.date(from:components)
//
//
//
//        let res = self.serverToLocal(date: setdate,timezone: usertimezone,format: "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'")
//        print(res)
//
//
//
//
//        return res?.pToString() ?? ""
//
//
//
//
//
//
//
//    }
    func serverToLocal(date:String,timezone:String,format:String) -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.timeZone = TimeZone(abbreviation:timezone)
            let localDate = dateFormatter.date(from: date)

            return localDate
        }
   
    func localTime(in timeZone: String) -> String {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime]
        f.timeZone = TimeZone(identifier: timeZone)
        return f.string(from: Date())
    }

    
    
   
              
  
    
    
    func setGradientBackground(view1:UIView) {
            
            
            let colorTop =  UIColor(red: 43.0/255.0, green: 92.0/255.0, blue: 171/255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 38.0/255.0, green: 198/255.0, blue: 218.0/255.0, alpha: 1.0).cgColor
                        
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = view1.bounds
                    
            view1.layer.insertSublayer(gradientLayer, at:0)
        }
        func setGradientBackgroundwithbutton(view1:UIButton) {
            
            
            let colorTop =  UIColor(red: 43.0/255.0, green: 92.0/255.0, blue: 171/255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 38.0/255.0, green: 198/255.0, blue: 218.0/255.0, alpha: 1.0).cgColor
                        
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: view1.frame.size.width, height: view1.frame.size.height)

            view1.layer.insertSublayer(gradientLayer, at:0)
        }
   
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DownloadApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}


let appdelegate = UIApplication.shared.delegate as! AppDelegate
