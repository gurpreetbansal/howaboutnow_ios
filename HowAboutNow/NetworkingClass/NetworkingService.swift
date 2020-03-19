//
//  NetworkingService.swift
//  MVC-S
//
//  Created by Kyle Lee on 8/20/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Foundation
import Alamofire
class NetworkingService {
    
    private init() {}
    static let shared = NetworkingService()
   
    //MARK: MULTIPART API
    func getPostMultipartRequest(action:String, parameters: [String:Any], imageKey:String, imageData:Data,success: @escaping(NSDictionary) -> Void, onFailure: @escaping(Error) -> Void){
        let headers = [ "content-type": "application/json",
                        //"userId" : "\(Singleton.shareInstance.userId)",
                        "Authorization": "Bearer " + "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            multipartFormData.append(imageData , withName: "file", fileName: imageKey, mimeType: "image/jpeg")
            
        }, to: baseUrl+action, headers: headers)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (progress) in
                    print(progress)
                })
                upload.responseJSON { DataResponse in
                    if DataResponse.result.value != nil {
                        success(DataResponse.result.value as! NSDictionary)
                    }
                }
            case .failure(_):
                
                break
            }
        }
        
    }
    //MARK: Documents MULTIPART Upload document
    func getPostMultipartForDocument(action:String,param: [String:Any],docData: Data?,docName: String, docMimeType: String, onSuccess: @escaping(DataResponse<Any>) -> Void, onFailure: @escaping(Error) -> Void){
        let headers = [ "content-type": "application/json",
                        "userId" : "\(Singleton.shareInstance.userId)",
            "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in param {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                
            }
            if docData != nil {
                if let data = docData{
                    multipartFormData.append(data, withName: "docname", fileName: docName, mimeType: "application/"+docMimeType)
                    //         multipartFormData.append(data, withName: "docname", fileName: "profile_pic.png", mimeType: "image/png")
                    
                    
                }
            }
            
        }, to: baseUrl+action, headers: headers)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    // print(progress)
                })
                upload.responseJSON { DataResponse in
                    
                    if DataResponse.result.value != nil {
                        onSuccess(DataResponse)
                    }
                    else
                    {
                        onFailure(DataResponse.result.error!)
                    }
                }
            case .failure(_):
                //onFailure(result as! Error)
                break
            }
        }
    }
    func getData_WithoutHeader(PostName: String,parameters: [String:String], completion: @escaping (Any)->Void) {
        let url = URL(string:baseUrl+PostName)
        Alamofire.request(url!, method:.post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch(response.result) {
            case .success(_):
                if let data = response.result.value
                {
                    print(response.result.value as Any)
                    print(data)
                    DispatchQueue.main.async {
                    completion(data)}
                }
                break
            case .failure(_):
                print(response.result.error!)

                break
            }
        }
    }
  
    func getData_withHeader(PostName: String, completion: @escaping (Any)->Void) {
        let url = URL(string:baseUrl+PostName)
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") ?? "")"]
        
        Alamofire.request(url!, method:.post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch(response.result) {
                
            case .success(_):
                if let data = response.result.value
                {
                    print(response.result.value as Any)
                    print(data)
                    DispatchQueue.main.async {
                        completion(response.data as Any)}
                }
                break
            case .failure(_):
                if let data = response.result.error
                {
                    print(response.result.value as Any)
                    print(data)
                }
                break
            }
        }
    }
    func Logout_withHeader(PostName: String, completion: @escaping (Any)->Void) {
        let url = URL(string:baseUrl+PostName)
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") ?? "")"]
        Alamofire.request(url!, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch(response.result) {
             case .success(_):
                if let data = response.result.value
                {
                    print(response.result.value as Any)
                    print(data)
                    DispatchQueue.main.async {
                        completion(response.data as Any)}
                }
                break
            case .failure(_):
                if let data = response.result.error
                {
                    print(response.result.value as Any)
                    print(data)
                }
                break
            }
        }
    }
 
    func getData_withHeaderParameter(PostName: String,parameters: [String:String], completion: @escaping (Any)->Void) {
        let url = URL(string:baseUrl+PostName)
        let headers = [ "content-type": "application/json",
                       // "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "Authorization": "Bearer " + "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.request(url!, method:.post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch(response.result) {
                
            case .success(_):
                if let data = response.result.value
                {
                    print(response.result.value as Any)
                    print(data)
                    DispatchQueue.main.async {
                        completion(data)}
                }
                break
            case .failure(_):
                if let data = response.result.error
                {
                    print(response.result.value as Any)
                    print(data)
                }
                break
            }
        }
    }
    func placeOrderData_withHeaderParameter(PostName: String,parameters: [String:Any], completion: @escaping (Any)->Void) {
        let url = URL(string:baseUrl+PostName)
        let headers = [ "content-type": "application/json",
                       // "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "Authorization": "Bearer " + "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.request(url!, method:.post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch(response.result) {
                
            case .success(_):
                if let data = response.result.value
                {
                    print(response.result.value as Any)
                    print(data)
                    DispatchQueue.main.async {
                        completion(data)}
                }
                break
            case .failure(_):
                if let data = response.result.error
                {
                    print(response.result.value as Any)
                    print(data)
                }
                break
            }
        }
    }
    func getData_withHeaderPara(PostName: String,parameters: [String:String], completion: @escaping (Any)->Void) {
    let url = URL(string:baseUrl+PostName)
    let headers = [ "content-type": "application/json",
                   //"userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                    "Authorization":  "Bearer " + "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
    Alamofire.request(url!, method:.get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
        switch(response.result) {
            
        case .success(_):
            if let data = response.result.value
            {
                print(response.result.value as Any)
                print(data)
                DispatchQueue.main.async {
                    completion(data)}
            }
            break
        case .failure(_):
            if let data = response.result.error
            {
                print(response.result.value as Any)
                print(data)
            }
            break
        }
    }
    }
    func getData_Header_WithoutParameter(PostName: String, completion: @escaping (Any)->Void) {
        let url = URL(string:baseUrl+PostName)
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        Alamofire.request(url!, method:.post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch(response.result) {
                
            case .success(_):
                if let data = response.result.value
                {
                    print(response.result.value as Any)
                    print(data)
                    DispatchQueue.main.async {
                        completion(data)}
                }
                break
            case .failure(_):
                if let data = response.result.error
                {
                    print(response.result.value as Any)
                    print(data)
                }
                break
            }
        }
    }
    
}



extension UIViewController: URLSessionDataDelegate,URLSessionTaskDelegate,URLSessionDelegate{
    //MARK:=================================  UPLOAD IMAGE ==========================================
    func uploadImageWithoutUserid(urlString:String,params:[String:String]?,imageKeyValue:String?,image:UIImage?,success:@escaping ( _ response: NSDictionary)-> Void, failure:@escaping ( _ error: Error) -> Void){
        
        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers = [ "content-type": "application/json",
                        "userId" : "\(Singleton.shareInstance.userId)",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        var request = URLRequest(url: URL(string: urlString)!)
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        //which field you have to sent image on server
        let fileName: String = imageKeyValue!
        if image != nil {
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"image.png\"\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(image!.jpegData(compressionQuality: 0.1)!)
            body.append("\r\n".data(using: String.Encoding.utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        request.httpBody = body as Data
        //  let session = URLSession.shared
        let session = URLSession(configuration:.default, delegate: (self as URLSessionDelegate), delegateQueue: .main)
        // var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            //   print(data as Any)
            DispatchQueue.main.async {
                // self.hideProgress()
                
                if(error != nil){
                    //  print(String(data: data!, encoding: .utf8) ?? "No response from server")
                    
                    failure(error!)
                    
                }
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        //      print(json)
                        success(json as! NSDictionary)
                        
                    }catch let err{
                        //    print(err)
                        
                        failure(err)
                        
                    }
                }
                
            }
            
        }
        task.resume()
    }
    //MARK:=================================  UPLOAD IMAGE ==========================================
    func uploadImage(urlString:String,params:[String:Any]?,imageKeyValue:String?,image:UIImage?,success:@escaping ( _ response: NSDictionary)-> Void, failure:@escaping ( _ error: Error) -> Void){
        
        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers = [ "content-type": "application/json",
                      // "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "Authorization":  "Bearer " + "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        
        var request = URLRequest(url: URL(string: urlString)!)
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        //which field you have to sent image on server
        
                let fileName: String = imageKeyValue!
                
            if image != nil {
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"image.png\"\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append(image!.jpegData(compressionQuality: 0.1)!)
                    body.append("\r\n".data(using: String.Encoding.utf8)!)
                }
       
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        request.httpBody = body as Data
        //  let session = URLSession.shared
        let session = URLSession(configuration:.default, delegate: (self as URLSessionDelegate), delegateQueue: .main)
        // var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            //   print(data as Any)
            DispatchQueue.main.async {
                // self.hideProgress()
                
                if(error != nil){
                    //  print(String(data: data!, encoding: .utf8) ?? "No response from server")
                    
                    failure(error!)
                    
                }
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        //      print(json)
                        success(json as! NSDictionary)
                        
                    }catch let err{
                        //    print(err)
                        
                        failure(err)
                        
                    }
                }
                
            }
            
        }
        task.resume()
    }
    func uploadImage2(urlString:String,params:[String:String]?,imageKeyValue:String?,image:UIImage?,TasksFiles:[UIImage]!,success:@escaping ( _ response: NSDictionary)-> Void, failure:@escaping ( _ error: Error) -> Void){
        
        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                        "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        var request = URLRequest(url: URL(string: urlString)!)
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        //which field you have to sent image on server
        if TasksFiles?.count != 0{
            for i in 0..<TasksFiles.count{
                // let fileName: String = "supported_files[\(i)]"
                let fileName: String = "\(imageKeyValue!)[\(i)]"
                if image != nil {
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"image.png\"\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append(image!.jpegData(compressionQuality: 0.1)!)
                    body.append("\r\n".data(using: String.Encoding.utf8)!)
                }
            }
        }
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        request.httpBody = body as Data
        //  let session = URLSession.shared
        let session = URLSession(configuration:.default, delegate: (self as URLSessionDelegate), delegateQueue: .main)
        // var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            //   print(data as Any)
            DispatchQueue.main.async {
                // self.hideProgress()
                
                if(error != nil){
                    //  print(String(data: data!, encoding: .utf8) ?? "No response from server")
                    
                    failure(error!)
                    
                }
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        //      print(json)
                        success(json as! NSDictionary)
                        
                    }catch let err{
                        //    print(err)
                        
                        failure(err)
                        
                    }
                }
                
            }
            
        }
        task.resume()
    }

    //MARK:================================= UPLOAD DOCUMENT ==========================================
    func uploadDocuments(urlString:String,params:[String:String]?,JobsFilesdocUrl:[String]!,ClientsFilesdocUrl:[String]!,JobFileDocExtension:[String],success:@escaping ( _ response: NSDictionary)-> Void, failure:@escaping ( _ error: Error) -> Void){
        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers = [ "content-type": "application/json",
                        "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
            "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
        print(headers)
        var request = URLRequest(url: URL(string: urlString)!)
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        
        if JobsFilesdocUrl?.count != 0{
            for i in 0..<JobsFilesdocUrl.count{
                let documentUrl = NSURL(string: JobsFilesdocUrl[i])
                if documentUrl != nil {
                    //which field you have to sent image on server
                    let fileName: String = "supported_files[\(i)]"
                    let ext = "info" + JobFileDocExtension[i]
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"\(ext)\"\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Type:application/pdf\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append(NSData(contentsOf: documentUrl! as URL)! as Data)
                    body.append("\r\n".data(using: String.Encoding.utf8)!)
                   
                }
            }
             body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        }
        
        if ClientsFilesdocUrl?.count != 0{
            for i in 0..<ClientsFilesdocUrl.count{
                let documentUrl = NSURL(string: ClientsFilesdocUrl[i])
                if documentUrl != nil {
                    //which field you have to sent image on server
                    let fileName: String = "client_files[\(i)]"
                    let ext = "info" + JobFileDocExtension[i]
                    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"\(ext)\"\r\n".data(using: String.Encoding.utf8)!)
                    body.append("Content-Type:application/pdf\r\n\r\n".data(using: String.Encoding.utf8)!)
                    body.append(NSData(contentsOf: documentUrl! as URL)! as Data)
                    body.append("\r\n".data(using: String.Encoding.utf8)!)
                    
                }
            }
            body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        }
        request.httpBody = body as Data
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if(error != nil){
                    // print(String(data: data!, encoding: .utf8) ?? "No response from server")
                    failure(error!)
                }
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        print(json)
                        success(json as! NSDictionary)
                     }catch let err{
                        print(err)
                        failure(err)
                     }
                }
            }
         }
        task.resume()
    }
   
        //MARK:================================= UPLOAD DOCUMENT ==========================================
         func uploadDocuments2(urlString:String,params:[String:String]?,JobsFilesdocUrl:[String]!,imageKeyValue:String!,DocExtension:String,success:@escaping ( _ response: NSDictionary)-> Void, failure:@escaping ( _ error: Error) -> Void){
             let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
             let contentType: String = "multipart/form-data; boundary=\(boundary)"
             let headers = [ "content-type": "application/json",
                             "userId" : "\(UserDefaults.standard.value(forKey: "USERID") ?? "")",
                 "AuthorizationToken": "\(UserDefaults.standard.value(forKey: "APITOKEN") as! String)"]
             var request = URLRequest(url: URL(string: urlString)!)
             
             for (key, value) in headers {
                 request.setValue(value, forHTTPHeaderField: key)
             }
             request.httpShouldHandleCookies = false
             request.timeoutInterval = 60
             request.httpMethod = "POST"
             request.setValue(contentType, forHTTPHeaderField: "Content-Type")
             
             let body = NSMutableData()
             if let parameters = params {
                 for (key, value) in parameters {
                     body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                     body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                     body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
                 }
             }
             
             if JobsFilesdocUrl?.count != 0{
                 for i in 0..<JobsFilesdocUrl.count{
                     let documentUrl = NSURL(string: JobsFilesdocUrl[i])
                     if documentUrl != nil {
                         //which field you have to sent image on server
                         let fileName: String = "\(imageKeyValue!)[\(i)]"
                        let ext = "info" + DocExtension
                         body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                         body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"\(ext)\"\r\n".data(using: String.Encoding.utf8)!)
                         body.append("Content-Type:application/pdf\r\n\r\n".data(using: String.Encoding.utf8)!)
                         body.append(NSData(contentsOf: documentUrl! as URL)! as Data)
                         body.append("\r\n".data(using: String.Encoding.utf8)!)
                        
                     }
                 }
                  body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
             }
             
             request.httpBody = body as Data
             let session = URLSession.shared
             let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
                 DispatchQueue.main.async {
                     if(error != nil){
                         // print(String(data: data!, encoding: .utf8) ?? "No response from server")
                         failure(error!)
                     }
                     if let responseData = data{
                         do {
                             let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                             print(json)
                             success(json as! NSDictionary)
                          }catch let err{
                             print(err)
                             failure(err)
                          }
                     }
                 }
              }
             task.resume()
         }
        
}





