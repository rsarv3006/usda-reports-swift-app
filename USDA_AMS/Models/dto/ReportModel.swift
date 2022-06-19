//
//  ReportModel.swift
//  USDA_AMS
//
//  Created by rjs on 6/1/22.
//

import Foundation

struct ReportModel: Codable {
    let slug_id: Int
    let slug_name: String
    let report_title: String
    let published_date: String
    let markets: [String]
    let market_types: [String]
    let offices: [String]
    let sectionNames: [String]
}

struct ReportModelHelpers {
    static func splitReportTitle(title: String) -> String {
        if let titleSplit = title.split(separator: "(").first {
            return String(titleSplit)
        } else {
            return title
        }
    }
    
    static func removeTimefromPublishedDate(publishedDate: String) -> String {
        if let dateSplit = publishedDate.split(separator: " ").first {
            return String(dateSplit)
        }
        
        return ""
    }
}
