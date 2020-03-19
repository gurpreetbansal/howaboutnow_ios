//
//  Extension.swift
//  fashLOCO
//
//  Created by apple on 24/04/19.
//  Copyright © 2019 apple. All rights reserved.
//
import Foundation
import UIKit
import NVActivityIndicatorView
fileprivate var activityIndicator : CustomActivityIndicatorView = {
    let image : UIImage = UIImage(named: "logo")!
    return CustomActivityIndicatorView(image: image)
}()
extension UIViewController: NVActivityIndicatorViewable
{
    //MARK: Add  image over navigastion bar
    func addNavigationBarImage(){
        let backgroundImage = UIImage(named: "nBg1")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), resizingMode: UIImage.ResizingMode.stretch)
        UINavigationBar.appearance().setBackgroundImage(backgroundImage, for: .default)
    }
    func addNavigationBarImage_withoutLogo(){
        let backgroundImage = UIImage(named: "nBg1")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), resizingMode: UIImage.ResizingMode.stretch)
        UINavigationBar.appearance().setBackgroundImage(backgroundImage, for: .default)
    }
    func addLogoInNavigationBar(){
        navigationItem.titleView = UIImageView(image: UIImage(named: "naviLogo"))
    }
    //MARK: show progress hud
    func showProgress() {
        let size = CGSize(width: 50, height:50)
        self.startAnimating(size, message:"Loading", messageFont: UIFont.systemFont(ofSize: 18.0), type: NVActivityIndicatorType.lineScale, color: UIColor.white, padding: 1, displayTimeThreshold: nil, minimumDisplayTime: nil)
    }
 
    //MARK: hide progress hud
    func hideProgress() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.stopAnimating() }
    }
    
    

    //MARK: ShowAlert...
    func ShowLogoutAlert(title: String, message: String, viewController: UIViewController) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    //MARK: ShowAlertView...
     func ShowAlertView(title: String, message: String, viewController: UIViewController) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // add the actions (buttons)
        //alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: Push Segue ...
    func performPushSeguefromController(identifier:String){
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func isValidEmail(testStr:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showExpiryToken_popupView(){
        let alert = UIAlertController(title: "Alert", message: "Your session has expired. Please login again!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default)  { (action:UIAlertAction) in
            UserDefaults.standard.removeObject(forKey: "USERID")
            UserDefaults.standard.removeObject(forKey: "APITOKEN")
            UserDefaults.standard.synchronize()
            self.performPushSeguefromController(identifier: "SignInVC")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: to clear all stored data on logout time ..
    func clearData(){
        UserDefaults.standard.removeObject(forKey: "USERID")
        UserDefaults.standard.removeObject(forKey: "APITOKEN")
        UserDefaults.standard.synchronize()
        
    }
    
   
    //MARK: Open Image with zooming view with Animation
//    func openImage(onTap imageName: String, view: UIViewController) {
//        // Create image info
//        let imageInfo = JTSImageInfo()
//        imageInfo.imageURL = URL(string: imageName)
//
//        let imageViewer = JTSImageViewController(imageInfo: imageInfo, mode: JTSImageViewControllerMode.image, backgroundStyle : JTSImageViewControllerBackgroundOptions(rawValue: Int(JTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay)))
//
//        imageViewer?.show(from: view, transition: JTSImageViewControllerTransition(rawValue: Int(JTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay))!)
//    }
    
    func getCountryPhonceCode (_ country : String) -> String
    {
        let countryDictionary  = ["AF":"93",
                                  "AL":"355",
                                  "DZ":"213",
                                  "AS":"1",
                                  "AD":"376",
                                  "AO":"244",
                                  "AI":"1",
                                  "AG":"1",
                                  "AR":"54",
                                  "AM":"374",
                                  "AW":"297",
                                  "AU":"61",
                                  "AT":"43",
                                  "AZ":"994",
                                  "BS":"1",
                                  "BH":"973",
                                  "BD":"880",
                                  "BB":"1",
                                  "BY":"375",
                                  "BE":"32",
                                  "BZ":"501",
                                  "BJ":"229",
                                  "BM":"1",
                                  "BT":"975",
                                  "BA":"387",
                                  "BW":"267",
                                  "BR":"55",
                                  "IO":"246",
                                  "BG":"359",
                                  "BF":"226",
                                  "BI":"257",
                                  "KH":"855",
                                  "CM":"237",
                                  "CA":"1",
                                  "CV":"238",
                                  "KY":"345",
                                  "CF":"236",
                                  "TD":"235",
                                  "CL":"56",
                                  "CN":"86",
                                  "CX":"61",
                                  "CO":"57",
                                  "KM":"269",
                                  "CG":"242",
                                  "CK":"682",
                                  "CR":"506",
                                  "HR":"385",
                                  "CU":"53",
                                  "CY":"537",
                                  "CZ":"420",
                                  "DK":"45",
                                  "DJ":"253",
                                  "DM":"1",
                                  "DO":"1",
                                  "EC":"593",
                                  "EG":"20",
                                  "SV":"503",
                                  "GQ":"240",
                                  "ER":"291",
                                  "EE":"372",
                                  "ET":"251",
                                  "FO":"298",
                                  "FJ":"679",
                                  "FI":"358",
                                  "FR":"33",
                                  "GF":"594",
                                  "PF":"689",
                                  "GA":"241",
                                  "GM":"220",
                                  "GE":"995",
                                  "DE":"49",
                                  "GH":"233",
                                  "GI":"350",
                                  "GR":"30",
                                  "GL":"299",
                                  "GD":"1",
                                  "GP":"590",
                                  "GU":"1",
                                  "GT":"502",
                                  "GN":"224",
                                  "GW":"245",
                                  "GY":"595",
                                  "HT":"509",
                                  "HN":"504",
                                  "HU":"36",
                                  "IS":"354",
                                  "IN":"91",
                                  "ID":"62",
                                  "IQ":"964",
                                  "IE":"353",
                                  "IT":"39",
                                  "JM":"1",
                                  "JP":"81",
                                  "JO":"962",
                                  "KZ":"77",
                                  "KE":"254",
                                  "KI":"686",
                                  "KW":"965",
                                  "KG":"996",
                                  "LV":"371",
                                  "LB":"961",
                                  "LS":"266",
                                  "LR":"231",
                                  "LI":"423",
                                  "LT":"370",
                                  "LU":"352",
                                  "MG":"261",
                                  "MW":"265",
                                  "MY":"60",
                                  "MV":"960",
                                  "ML":"223",
                                  "MT":"356",
                                  "MH":"692",
                                  "MQ":"596",
                                  "MR":"222",
                                  "MU":"230",
                                  "YT":"262",
                                  "MX":"52",
                                  "MC":"377",
                                  "MN":"976",
                                  "ME":"382",
                                  "MS":"1",
                                  "MA":"212",
                                  "MM":"95",
                                  "NA":"264",
                                  "NR":"674",
                                  "NP":"977",
                                  "NL":"31",
                                  "AN":"599",
                                  "NC":"687",
                                  "NZ":"64",
                                  "NI":"505",
                                  "NE":"227",
                                  "NG":"234",
                                  "NU":"683",
                                  "NF":"672",
                                  "MP":"1",
                                  "NO":"47",
                                  "OM":"968",
                                  "PK":"92",
                                  "PW":"680",
                                  "PA":"507",
                                  "PG":"675",
                                  "PY":"595",
                                  "PE":"51",
                                  "PH":"63",
                                  "PL":"48",
                                  "PT":"351",
                                  "PR":"1",
                                  "QA":"974",
                                  "RO":"40",
                                  "RW":"250",
                                  "WS":"685",
                                  "SM":"378",
                                  "SA":"966",
                                  "SN":"221",
                                  "RS":"381",
                                  "SC":"248",
                                  "SL":"232",
                                  "SG":"65",
                                  "SK":"421",
                                  "SI":"386",
                                  "SB":"677",
                                  "ZA":"27",
                                  "GS":"500",
                                  "ES":"34",
                                  "LK":"94",
                                  "SD":"249",
                                  "SR":"597",
                                  "SZ":"268",
                                  "SE":"46",
                                  "CH":"41",
                                  "TJ":"992",
                                  "TH":"66",
                                  "TG":"228",
                                  "TK":"690",
                                  "TO":"676",
                                  "TT":"1",
                                  "TN":"216",
                                  "TR":"90",
                                  "TM":"993",
                                  "TC":"1",
                                  "TV":"688",
                                  "UG":"256",
                                  "UA":"380",
                                  "AE":"971",
                                  "GB":"44",
                                  "US":"1",
                                  "UY":"598",
                                  "UZ":"998",
                                  "VU":"678",
                                  "WF":"681",
                                  "YE":"967",
                                  "ZM":"260",
                                  "ZW":"263",
                                  "BO":"591",
                                  "BN":"673",
                                  "CC":"61",
                                  "CD":"243",
                                  "CI":"225",
                                  "FK":"500",
                                  "GG":"44",
                                  "VA":"379",
                                  "HK":"852",
                                  "IR":"98",
                                  "IM":"44",
                                  "JE":"44",
                                  "KP":"850",
                                  "KR":"82",
                                  "LA":"856",
                                  "LY":"218",
                                  "MO":"853",
                                  "MK":"389",
                                  "FM":"691",
                                  "MD":"373",
                                  "MZ":"258",
                                  "PS":"970",
                                  "PN":"872",
                                  "RE":"262",
                                  "RU":"7",
                                  "BL":"590",
                                  "SH":"290",
                                  "KN":"1",
                                  "LC":"1",
                                  "MF":"590",
                                  "PM":"508",
                                  "VC":"1",
                                  "ST":"239",
                                  "SO":"252",
                                  "SJ":"47",
                                  "SY":"963",
                                  "TW":"886",
                                  "TZ":"255",
                                  "TL":"670",
                                  "VE":"58",
                                  "VN":"84",
                                  "VG":"284",
                                  "VI":"340"]
        if countryDictionary[country] != nil {
            return countryDictionary[country]!
        }else {
            return ""
        }

    }
    
}
//MARK: Gradient layer for navigation bar..
extension CAGradientLayer {
    class func primaryGradient(on view: UIView) -> UIImage? {
        let gradient = CAGradientLayer()
        let firstColor = UIColor(red: 229/255.0, green: 16/255.0, blue: 113/255.0, alpha: 1.0)
        let secondColor = UIColor(red: 160.0/255.0, green: 50.0/255.0, blue: 136.0/255.0, alpha: 1.0)
        var bounds = view.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.5, y: 0)
        return gradient.createGradientImage(on: view)
    }
    
    private func createGradientImage(on view: UIView) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    // usage
    //        guard
    //            let navigationController = navigationController,
    //            let flareGradientImage = CAGradientLayer.primaryGradient(on: navigationController.navigationBar)
    //            else {
    //                print("Error creating gradient color!")
    //                return
    //        }
    //
    //        navigationController.navigationBar.barTintColor = UIColor(patternImage: flareGradientImage)
}

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        self.attributedText = attribute
    }
}
extension UIViewController{
    func addLoadingIndicator () {
        self.view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
    }
    func startAnim() {
        //        backView.isHidden = false
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicator.startAnimating()
    }
    
    func stopAnim() {
        //        backView.isHidden = true
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
extension UIView{
    //Shake Animation
    func shakeAnimation(shakeView:UIView){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 10
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: shakeView.center.x - 10, y: shakeView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: shakeView.center.x + 10, y: shakeView.center.y))
        shakeView.layer.add(animation, forKey: "position")
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}



// Animation for drop down views ...
//if isSearchActive == "no"{
//    UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
//        self.searchView.isHidden = false
//        self.TableViewTopConstraints.constant = 50
//        self.isSearchActive = "yes"
//        self.view.layoutIfNeeded()
//
//    }, completion: nil)
//
//}else{
//    UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
//        self.searchView.isHidden = true
//        self.TableViewTopConstraints.constant = 0
//        self.isSearchActive = "no"
//        self.view.layoutIfNeeded()
//
//    }, completion: nil)
//
//}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}
