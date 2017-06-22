//
//  Constants.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

let ApiKey = "a761e33f55472adc699fdaafb87c4dd8"

typealias ResultCompletionHandler = (ResultCompletion)->Void
typealias ResultCompletion = (request:URLRequest?, response:URLResponse?, value:Any?, error:Error?)

enum httpMethod {
    case get
    case post
    
    var toString:String{
        return "\(self)"
    }
    var description:String {
        return self.toString.uppercased()
    }
}

let baseURL = "http://api.openweathermap.org/data/2.5"
