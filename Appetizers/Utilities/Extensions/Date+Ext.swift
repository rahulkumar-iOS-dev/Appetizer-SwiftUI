//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Rahul Kumar on 13/01/24.
//

import Foundation

extension Date {
    
    var eighteenYearAgo: Date  {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearAgo: Date  {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
