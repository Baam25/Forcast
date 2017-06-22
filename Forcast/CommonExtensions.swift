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
    
    func epochToFullDateString() -> String {
        
        let d = Date(timeIntervalSince1970: TimeInterval(self))
        return d.toFullString()
    }
    func epochToLongDateString() -> String {
        
        let d = Date(timeIntervalSince1970: TimeInterval(self))
        return d.toLongString()
    }
}

extension Date{
    
    func toFullString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        //dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from: self)
    }
    
    func toLongString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        //dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from: self)
    }
}
