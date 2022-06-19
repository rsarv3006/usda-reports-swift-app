//
//  DateHelpers.swift
//  USDA_AMS
//
//  Created by rjs on 6/15/22.
//

import Foundation

extension Date {
    func convertToString(format: String = "MM/dd/yyyy") -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = format
        return dateFormatterPrint.string(from: self)
        
    }
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
}
