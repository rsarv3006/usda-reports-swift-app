//
//  ModelMap.swift
//  USDA_AMS
//
//  Created by rjs on 6/17/22.
//

import Foundation

enum ReportSectionMap: String {
    case summary = "Summary"
    case currentVolume = "Current Volume"
    
}

//func getSectionModel(forSection sectionName: String) throws -> Decodable.Protocol {
//    switch(sectionName) {
//    case ReportSectionMap.summary.rawValue:
//        return ReportSectionSummaryModel.self
//    default:
//        throw SectionMappingError.runtimeError("Section Mapping Not Found")
//        
//    }
//}

enum SectionMappingError: Error {
    case runtimeError(String)
}
