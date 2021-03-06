//
//  WeatherViewModel.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class WeatherViewModel{
    
    var dateLabel:String!
    var temperatureViewModel:TemperatureViewModel!
    var pressureLabel:String!
    var humidityLabel:String!
    var descriptionLabel:String!
    
    convenience init(weather:Weather) {
        
        self.init()
        self.dateLabel = weather.date.epochToLongDateString()
        self.temperatureViewModel = TemperatureViewModel(temperature: weather.temperature)
        self.pressureLabel = weather.pressure.toString()! + " hPa"
        self.humidityLabel = weather.humidity.toString() + "%"
        self.descriptionLabel = weather.description.capitalized
    }
    init() {}
    
    
}
