//
//  City.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class City {
    
    var id:Int!
    var name:String!
    var weather:Weather!
    
    convenience init(with _id:Int, city _name:String,_ _weather: Weather) {
        
        self.init()
        
        self.id = _id
        self.name = _name
        self.weather = _weather
    }
    
    init() {}
}
