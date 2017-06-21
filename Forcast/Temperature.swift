//
//  Temperature.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation

class Temperature {
    
    var temperature:Double?
    var temperature_day:Double?
    var temp_min:Double!
    var temp_max:Double!
    
    convenience init(_ temperature:Double?,_ temperature_day:Double?, temp_min:Double!, temp_max:Double!){
            self.init()
        self.temperature = temperature
        self.temperature_day = temperature_day
        self.temp_max = temp_max
        self.temp_min = temp_min
    }
    
    init(){}
    
}
