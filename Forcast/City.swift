//
//  City.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class City {
    

    var name:String!
    var weather:Weather!
    
    convenience init(city _name:String,_ _weather: Weather) {
        
        self.init()
        
        
        self.name = _name
        self.weather = _weather
    }
    
    init() {}
}
