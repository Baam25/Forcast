//
//  CityViewModel.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class CityViewModel {
    
    var nameLabelText:String!
    var weatherView:WeatherViewModel!
    
    convenience init(city:City) {
        self.init()
        
        self.weatherView = WeatherViewModel()
        self.nameLabelText = city.name.capitalized
    }
    
    init() {}
    
}
