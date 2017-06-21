
//
//  TemperatureViewModel.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class TemperatureViewModel {
    var temperatureLabel:String?
    var temperature_dayLabel:String?
    var temp_minLabel:String!
    var temp_maxLabel:String!
    
    convenience init(temperature:Temperature){
        self.init()
        self.temperatureLabel = temperature.temperature?.toString()
        self.temperature_dayLabel = temperature.temperature_day?.toString()
        self.temp_maxLabel = temperature.temp_max.toString()
        self.temp_minLabel = temperature.temp_min.toString()
    }
    
    init(){}
    
    
}
