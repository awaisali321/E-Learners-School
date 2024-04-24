//
//  Extensions.swift
//  RGB
//
//  Created by invision75 on 03/11/2021.
//

import UIKit
extension UIApplication {

    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }

}
extension String {
    var isValidPassword:Bool {
        let passwordRegex = "^" +
        "(?=.*[0-9])" +         //at least 1 digit
        "(?=.*[a-z])" +         //at least 1 lower case letter
        "(?=.*[A-Z])" +         //at least 1 upper case letter
        "(?=.*[a-zA-Z])" +      //any letter
        "(?=.*[@#$%^&+=!])" +    //at least 1 special character
        "(?=\\S+$)" +           //no white spaces
        ".{8,}" +               //at least 8 characters
        "$"
        return self.range(of: passwordRegex, options: .regularExpression) != nil ? true : false
    }
    func remainingDaysFromCurrentDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.date(from: self)
        
    }
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    /// mask example: `+X (XXX) XXX-XXXX`
    func format(with mask: String) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
}

extension UIViewController{
    func popController(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension Bool {
    var intValue: Int {
        return self ? 1 : 0
    }
}
extension Int {
    func decToHexString() -> String {
        //        let result = decToHexStringFormat()
        let result = createString(radix: 16)
        return result
    }
    fileprivate  func createString(radix: Int) -> String {
            return String(self, radix: radix, uppercase: true)
        }
}
extension String {
    var boolValue: Bool {
        return (self as NSString).boolValue
    }}
extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return self.map { String(format: format, $0) }.joined()
    }
    var checksum: Int {
        return self.map { Int($0) }.reduce(0, +) & 0xff
    }
}
extension CALayer {
    public func configureGradientBackground(_ colors:CGColor...){
        
        let gradient = CAGradientLayer()
        let maxWidth = max(self.bounds.size.height,self.bounds.size.width)
        let squareFrame = CGRect(origin: self.bounds.origin, size: CGSize(width: maxWidth, height: maxWidth))
        gradient.frame = squareFrame
        gradient.colors = colors
        self.insertSublayer(gradient, at: 0)
    }
}

extension UIView{
    func makeRounded() {
        
         self.layer.masksToBounds = true
         self.layer.cornerRadius = self.frame.height / 2
         self.clipsToBounds = true
         
         self.layer.shadowColor = UIColor.black.cgColor
         self.layer.shadowOpacity = 1
         self.layer.shadowOffset = .zero
         self.layer.shadowRadius = 2
    }
    
    func addShadow(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 0.3
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 0.0
    }
    func addBottomShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,                                                  y: bounds.maxY - layer.shadowRadius,                                                  width: bounds.width,                                                  height: layer.shadowRadius)).cgPath
        
    }
    func fadeIn()  {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 1
        }, completion: nil)
    }
    func fadeout()  {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    func round(corners: UIRectCorner, cornerRadius: Double) {
        
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}
extension UIFont {
  public enum fontType: String {
    case regular = ""
    case kFontBlackItalic = "Montserrat-BlackItalic"
    case kFontExtraBoldItalic = "Montserrat-ExtraBoldItalic"
    case kFontBoldItalic = "Montserrat-BoldItalic"
    case kFontSemiBoldItalic = "Montserrat-SemiBoldItalic"
    case kFontMediumItalic = "Montserrat-MediumItalic"
    case kFontItalic = "Montserrat-Italic"
    case kFontLightItalic = "Montserrat-LightItalic"
    case kFontBlack = "Poppins-Bold"
    case kFontExtraLightItalic = "Montserrat-ExtraLightItalic"
    case kFontThinItalic = "Montserrat-ThinItalic"
    case kFontExtraBold = "Montserrat-ExtraBold"
    case kFontBold = "Montserrat-Bold"
    case kFontSemiBold = "Montserrat-SemiBold"
    case kFontMedium = "Montserrat-Medium"
    case kFontRegular = "Montserrat-Regular"
    case kFontLight = "Montserrat-Light"
    case kFontExtraLight = "Montserrat-ExtraLight"
    case kFontThin = "Montserrat-Thin"
}
    
static func setFont(_ type: fontType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont? {
    return UIFont(name: type.rawValue, size: size)
    }
 }
   
extension Double{
    func roundTo(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toCelsius(degree: Double) -> Double {
        return degree - 273.15
    }

    func toFahrenheit(degree: Double) -> Double {
        return (degree - 273.15) * 1.8 + 32.0
    }
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
extension CGFloat {
    func toCelsius(degree: CGFloat) -> CGFloat {
        return degree - 273.15
    }

    func toFahrenheit(degree: CGFloat) -> CGFloat {
        return (degree - 273.15) * 1.8 + 32.0
    }
}
extension UIImage {
    class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        //    Or if you need a thinner border :
        //    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

extension UINavigationController {
    func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        pushViewController(viewController, animated: animated)
        
        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
    
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        popViewController(animated: animated)
        
        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

extension Date {
    var currentTimeStamp:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let time = formatter.string(from: self)
        return time
    }
    func getFormattedDate(format: String) -> String {
         let dateformat = DateFormatter()
         dateformat.dateFormat = format
         return dateformat.string(from: self)
     }
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    

}


extension NSMutableAttributedString {

    func setBoldText(textForAttribute: String, withColor color: UIColor, withFontSize size: Int) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: CGFloat(size), weight: .bold), range: range)

    }

}
