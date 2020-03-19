//
//  Singleton.swift
//  TaxiApp
//
//  Created by Dharmendra on 04/11/19.
//  Copyright © 2019 Ashish_IOS. All rights reserved.
//

import Foundation

final class Singleton {
    static let shareInstance = Singleton()
    private init() {}
    
  //  var locCordinate = CLLocationCoordinate2D()
    var myCurrentLongitude: Double = 0.0
    var myCurrentLatitude: Double = 0.0
    var userId = ""
    var lng = "en"
    var userDetails = NSDictionary()
}
