//
//  Services.swift
//  RGB
//
//  Created by usamaghalzai on 15/11/2021.
//  Copyright © 2021 usamaghalzai. All rights reserved.
//

import Foundation
import UIKit
enum SenderType: String {
    case dealer = "Dealer"
    case support = "AAV Support"

    var backgroundColor : UIColor {
        switch self {
        case .dealer:
            return UIColor.init(hexString: "F2994A").withAlphaComponent(0.25)
        case .support:
            return UIColor.init(hexString: "2F80ED").withAlphaComponent(0.25)
        }
    }
    var textColor : UIColor {
        switch self {
        case .dealer:
            return UIColor.init(hexString: "F2994A")
        case .support:
            return UIColor.init(hexString: "2F80ED")
        }
    }
}
enum NetworkEnvironment {
    case live
    case staging
}
struct AppConstants {
    static let gcmMessageIDKey = ""
    static let PRODUCT_ID: Int = 2
    struct API{
        static let environment: NetworkEnvironment = .staging
        static var baseURL: URL {
            switch AppConstants.API.environment{
                case .live:
                    return URL(string: "https://watim.elearners.com.pk/api/")!
                    
                case .staging:
                    return URL(string: "https://watim.elearners.com.pk/api/")!
                
            }
        }
      
        
        static let imagebaseurl = "https://watim.elearners.com.pk"
        //static let signalRHUB = "https://aquaticavchatdev.azurewebsites.net/signalr"
        
    //    static let signalRHUB = "https://5fbe-2407-d000-a-ba51-44b1-db3d-583b-1a6c.ngrok.io/signalr"
        
        //static let ngRokSignalR = "https://9eb1-206-84-151-58.ngrok.io/signalr"
        
        //static let ngRokSignalR = "https://5fbe-2407-d000-a-ba51-44b1-db3d-583b-1a6c.ngrok.io/signalr"
        static let signalRConnectionURL = URL(string: "https://aquaticavchat.azurewebsites.net/api/")!
        //static let signalRConnectionURL = URL(string: "https://aquaticavchatdev.azurewebsites.net/api/")!
        
    //    static let signalRConnectionURL = URL(string: "https://5fbe-2407-d000-a-ba51-44b1-db3d-583b-1a6c.ngrok.io/api/")!
       
        static let ngrokConnectionURL = URL(string: "https://5fbe-2407-d000-a-ba51-44b1-db3d-583b-1a6c.ngrok.io/api/")!
        
    
        
        //static let ngrokConnectionURL = URL(string: "https://9eb1-206-84-151-58.ngrok.io/api/")!
        static var baseURLString = AppConstants.API.baseURL.absoluteString
        static let imageBasePath:String = "https://aavazurestorage.blob.core.windows.net/ofishassetsstaging/"
    }
    struct UserDefaultKeys{
        static let user = "user"
    }
    struct Keys{
        static let googleApiKey = "AIzaSyDmGVRqxuXsUGlDBosd3I5ptRVySLSi6UQ"
    }
}

