//
//  ReportSectionSummary.swift
//  USDA_AMS
//
//  Created by rjs on 6/17/22.
//

import Foundation

struct ReportSectionSummaryModel: Codable {
    let reportSection: String
    let reportSections: [String]
    let results: [ReportSectionSummaryResultModel]
}

struct ReportSectionSummaryResultModel: Codable {
    let report_date: String
    let is_correction: Bool?
    let narrative: String?
    let trend: String?
    let report_title: String
    let slug_name: String
    let slug_id: String
    let office_name: String
    let office_code: String
    let office_city: String
    let office_state: String
    let market_location_name: String
    let market_location_city: String
    let market_location_state: String
    let market_type: String
    let market_type_category: String
    let published_date: String
}

//{
//    "reportSection": "Summary",
//    "reportSections": [
//        "Summary",
//        "Current Volume",
//        "Central",
//        "National"
//    ],
//    "stats": {
//        "totalRows:": 1,
//        "returnedRows:": 1,
//        "userAllowedRows:": 99999
//    },
//    "results": [
//        {
//            "report_date": "06/16/2022",
//            "is_correction": null,
//            "narrative": null,
//            "trend": "Compared to last market test: Lean boneless was steady to weak; 85% trimmings were generally steady; 65% was mostly firm to higher; Beef trimmings sharply lower on light to moderate demand and offerings.",
//            "report_title": "National/Regional Daily Boneless Processing Beef/ Beef Trimmings - PM (PDF) (LM_XB401)",
//            "slug_name": "AMS_2451",
//            "slug_id": "2451",
//            "office_name": "Des Moines, IA",
//            "office_code": "LS-NW",
//            "office_city": "Des Moines",
//            "office_state": "IA",
//            "market_location_name": "Des Moines, IA",
//            "market_location_city": "Des Moines",
//            "market_location_state": "IA",
//            "market_type": "Direct Livestock - LMR Beef",
//            "market_type_category": "Direct Livestock - LMR Beef",
//            "published_date": "06/16/2022 14:29:21"
//        }
//    ]
//}
