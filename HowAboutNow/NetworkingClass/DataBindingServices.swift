//
//  DataBindingExtension.swift
//  QuizApp
//
//  Created by Apple on 07/06/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

// ============ used for handling Joker list data from JokerListModel =====================
struct DataService {
   // MARK: - Singleton
    static let shared = DataService()
    
    // MARK: - Joker Services
    func requestFetchJokerList(with action:String, completion: @escaping (Any?, Error?) -> ()) {
        let url = baseUrl+action
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") as! String)",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let data = response.result.value {
                print(data)
                completion(data, nil)
                return
                
            }
        }
    }
    // MARK: - Eraser Services
    func requestFetchEraserList(with action:String, completion: @escaping (Any?, Error?) -> ()) {
        let url = baseUrl+action
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") as! String)",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let data = response.result.value {
                print(data)
                completion(data, nil)
                return
                
            }
        }
    }
    
    // MARK: - HomeList Services
    func requestFetchHomeList(with action:String, completion: @escaping (Any?, Error?) -> ()) {
        let url = baseUrl+action
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") as! String)",
            "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let data = response.result.value {
                print(data)
                completion(data, nil)
                return
                
            }
        }
    }
}
