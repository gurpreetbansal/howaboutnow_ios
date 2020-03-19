//
//  SignINUPViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 04/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit
import MapKit
class SignINUPViewController: UIViewController {
    @IBOutlet weak var LoginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    @IBOutlet weak var confrimPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signUpline: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signInLine: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signBtn: UIButton!
    
    @IBOutlet weak var FNLine: UIView!
    @IBOutlet weak var ELine: UIView!
    @IBOutlet weak var PLine: UIView!
    @IBOutlet weak var CPLine: UIView!
    @IBOutlet weak var LELine: UIView!
    @IBOutlet weak var LPLine: UIView!
    
    var LoginViewModelHandler = SignInUpViewModel()
    var locationManager = CLLocationManager()
    var sing = Singleton.shareInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setup_SignUP()
        MapDelegate()
        
        
        
        // Do any additional setup after loading the view.
    }
    func shakeAnimation(shakeView:UIView){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: shakeView.center.x - 10, y: shakeView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: shakeView.center.x + 10, y: shakeView.center.y))
        shakeView.layer.add(animation, forKey: "position")
    }
    func setup_SignIN(){
        self.signBtn.setTitle("SIGN IN", for: .normal)
        self.signInBtn.setTitleColor(UIColor.black, for: .normal)
        self.signUpBtn.setTitleColor(UIColor.lightGray, for: .normal)
        self.signInLine.backgroundColor = UIColor.black
        self.signUpline.backgroundColor = UIColor.clear
        self.signInView.isHidden = false
        self.signUpView.isHidden = true
    }
    func setup_SignUP(){
        self.signBtn.setTitle("SIGN UP", for: .normal)
        self.signInBtn.setTitleColor(UIColor.lightGray, for: .normal)
        self.signUpBtn.setTitleColor(UIColor.black, for: .normal)
        self.signInLine.backgroundColor = UIColor.clear
        self.signUpline.backgroundColor = UIColor.black
        self.signInView.isHidden = true
        self.signUpView.isHidden = false
    }
    func validations() {
        if self.fullname.text == "" && self.email.text == "" && self.password.text == "" && self.confrimPassword.text == "" {
            FNLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: FNLine)
            ELine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: ELine)
            PLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: PLine)
            CPLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: CPLine)
        }
        else if self.fullname.text == "" {
            FNLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: FNLine)
            
            ELine.backgroundColor = UIColor.lightGray
            PLine.backgroundColor = UIColor.lightGray
            CPLine.backgroundColor = UIColor.lightGray
        
        }
        else if email.text == "" {
            ELine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: ELine)
            
            FNLine.backgroundColor = UIColor.lightGray
            PLine.backgroundColor = UIColor.lightGray
            CPLine.backgroundColor = UIColor.lightGray
        }
        else if (isValidEmail(testStr: self.email.text!) == false){
            ELine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: ELine)
            
            FNLine.backgroundColor = UIColor.lightGray
            PLine.backgroundColor = UIColor.lightGray
            CPLine.backgroundColor = UIColor.lightGray
        }
        else if password.text == "" {
            PLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: PLine)
            
            FNLine.backgroundColor = UIColor.lightGray
            ELine.backgroundColor = UIColor.lightGray
            CPLine.backgroundColor = UIColor.lightGray
        }
        else if password.text!.count < 6 {
            ShowAlertView(title: "Alert", message: "Password should be greater then six characters", viewController: self)
            PLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: PLine)
            FNLine.backgroundColor = UIColor.lightGray
            ELine.backgroundColor = UIColor.lightGray
            CPLine.backgroundColor = UIColor.lightGray
        }
        else if confrimPassword.text == "" {
            CPLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: CPLine)
            
            FNLine.backgroundColor = UIColor.lightGray
            ELine.backgroundColor = UIColor.lightGray
            PLine.backgroundColor = UIColor.lightGray
        }
        else if confrimPassword.text != password.text {
            ShowAlertView(title: "Alert", message: "Confrim password should be same as password", viewController: self)
            CPLine.backgroundColor = UIColor.red
            shakeAnimation(shakeView: CPLine)
            
            FNLine.backgroundColor = UIColor.lightGray
            ELine.backgroundColor = UIColor.lightGray
            PLine.backgroundColor = UIColor.lightGray
        }
        else {
            FNLine.backgroundColor = UIColor.lightGray
            ELine.backgroundColor = UIColor.lightGray
            PLine.backgroundColor = UIColor.lightGray
            CPLine.backgroundColor = UIColor.lightGray
            registerAPI()
        }
    }
       
    @IBAction func signUP(_ sender: UIButton) {
        setup_SignUP()
    }
    @IBAction func signIN(_ sender: UIButton) {
        setup_SignIN()
    }
    
    @IBAction func SignINUP(_ sender: UIButton) {
        validations()
        //performPushSeguefromController(identifier: "TabBarController")
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPwdViewController") as! ForgotPwdViewController
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func registerAPI(){
        showProgress()
        let params = ["first_name": fullname.text!,
                      "last_name":"",
                      "device":"iOS",
                      "device_token": "123123123123133131313313133133113313",
                      "email":email.text!,
                      "password": password.text!,
                      "lat":"\(Singleton.shareInstance.myCurrentLatitude)",
                      "lng":"\(Singleton.shareInstance.myCurrentLongitude)",]
        LoginViewModelHandler.getLoginData_WithoutHeader(parameters: params) { (message, result) in
            self.hideProgress()
        }
       
        
    }
    func sague(){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerificationVC") as! VerificationVC
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK:- Get user current location
extension SignINUPViewController: CLLocationManagerDelegate {
    func MapDelegate(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            print("Latitude :- \(location.coordinate.latitude)")
            print("Longitude :-\(location.coordinate.longitude)")
            
            sing.myCurrentLongitude = (location.coordinate.longitude)
            sing.myCurrentLatitude = (location.coordinate.latitude)
            
            self.locationManager.stopUpdatingLocation()
            // self.setMarker(poistion: center)
        }
        
        
    }
    //MARK: Call to Location Manager Delegates to check authorization status
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            manager.requestWhenInUseAuthorization()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
            // If always authorized
            
            break
        case .restricted:
            // If restricted by e.g. parental controls. User can't enable Location Services
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Settings", style: .default, handler: {(alert: UIAlertAction!) in
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            })
            let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(okAction)
            alert.addAction(CancelAction)
            present(alert, animated: true, completion: nil)
            break
        case .denied:
            // If user denied your app access to Location Services, but can grant access from Settings.app
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Settings", style: .default, handler: {(alert: UIAlertAction!) in
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            })
            let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(okAction)
            alert.addAction(CancelAction)
            present(alert, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
        
    }
}
