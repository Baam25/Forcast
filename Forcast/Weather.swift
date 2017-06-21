//
//  Weather.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class Weather {
    
    var date:Int!
    var temperature:Temperature!
    var pressure:Double!
    var humidity:Int!
    var description:String!
    
    convenience init(date:Int,temperature:Temperature,pressure:Double,humidity:Int,description:String) {
        self.init()
        self.date = date
        self.temperature = temperature
        self.pressure = pressure
        self.humidity = humidity
        self.description = description
    }
    
    init() {}
}
