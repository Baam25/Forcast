
//
//  TemperatureViewModel.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class TemperatureViewModel {
    private var temperatureLabel:String?
    private var temperature_dayLabel:String?
    private var temp_minLabel:String!
    private var temp_maxLabel:String!
    var highLowLabel:String!
    var temperature_Label:String!
    
    convenience init(temperature:Temperature){
        self.init()
        self.temperatureLabel = temperature.temperature?.toString()
        self.temperature_dayLabel = temperature.temperature_day?.toString()
        self.temp_maxLabel = temperature.temp_max.toString()!+"°C"
        self.temp_minLabel = temperature.temp_min.toString()!+"°C"
        
        self.highLowLabel = "▲ "+self.temp_maxLabel + " / " + self.temp_minLabel + " ▼"
        self.temperature_Label = (self.temperatureLabel ?? temperature_dayLabel!)+"°C"
    }
    
    init(){}
    
    
}
