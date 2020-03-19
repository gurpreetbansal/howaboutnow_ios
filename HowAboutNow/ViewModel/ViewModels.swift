//
//  ViewModels.swift
//  HowAboutNow
//
//  Created by iMarkPC on 18/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import Foundation
 
class SignInUpViewModel {
      var fbDatadict: NSDictionary = [:]
}
extension SignInUpViewModel{
    func getLoginData_WithoutHeader(parameters: [String:String], completion: @escaping (_ failure: String?, _ response: [String: Any]) -> Void) {
        NetworkingService.shared.getData_WithoutHeader(PostName: APIEndPoint.userCase.signup.caseValue, parameters: parameters) { (response) in
            print(response)
            let dic = response as! [String : Any]
            if (dic["code"] as! String == "200"){
                completion("success", dic )
            } else {
                completion((dic["response"] as! String), [:])
            }
        }
    }
}
