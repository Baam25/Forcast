//
//  CommonExtensions.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation


extension Double {
    
    func toString() -> String? {
        return "\(self)"
    }
}

extension Int {
    func toString() -> String {
        return "\(self)"
    }
    
    func epochToDateString() -> String {
        
        let d = Date(timeIntervalSince1970: TimeInterval(self))
        return d.toString()
    }
}

extension Date{
    
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        //dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from: self)
    }
}
