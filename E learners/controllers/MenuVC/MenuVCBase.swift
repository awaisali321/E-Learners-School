//
//  ProSideMenuBase.swift
//  AgorzCustomer
//
//  Created by admin on 2/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SideMenuController

class MenuVCBase: SideMenuController {
    required init?(coder aDecoder: NSCoder) {
        
        
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .underCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 250
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.transitionAnimator = FadeAnimator.self
        SideMenuController.preferences.animating.statusBarBehaviour = .showUnderlay
        

        super.init(coder: aDecoder)
        
    }
    
    var Segue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ActivityIndicatorSingleton.StopActivity(myView: self.view)
//
//        print("segue is \(Segue)")
//        //self.StatusChecking()
//       // self.Segue = (UserDefaults.standard.string(forKey: "Status") ?? "False")
//        let status =  "\(UserDefaults.standard.string(forKey: "Status") ?? "0")"
//
//        print("status is \(status)")
//        if status == "1"
//
        
           self.performSegue(withIdentifier: "MenuHomeVC", sender: nil)
           self.performSegue(withIdentifier: "MenuListSegueue", sender: nil)
//        }
//        else
//        {
//            self.performSegue(withIdentifier: "country", sender: nil)
//            self.performSegue(withIdentifier: "proSideMenuSegue", sender: nil)
//        }
        
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
}

