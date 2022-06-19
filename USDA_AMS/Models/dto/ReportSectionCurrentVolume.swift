//
//  ReportSectionCurrentValue.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation

struct ReportSectionCurrentVolumeModel: Codable {
    let reportSection: String
    let reportSections: [String]
    let results: [ReportSectionCurrentVolumeResultModel]
}

struct ReportSectionCurrentVolumeResultModel: Codable {
    let report_date: String
    let narrative: String?
    let trend: String?
    let choice_volume_loads: String?
    let select_volume_loads: String?
    let trimmings_volume_loads: String?
    let coarse_volume_loads: String?
    let choice_volume_pounds: String?
    let select_volume_pounds: String?
    let trimmings_volume_pounds: String?
    let coarse_volume_pounds: String?
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
    
    let central_volume_loads: String?
    let national_volume_loads: String?
    let central_volume_pounds: String?
    let national_volume_pounds: String?
    
}

//"central_volume_loads": "8.10",
//"national_volume_loads": "18.59",
//"central_volume_pounds": "324,190",
//"national_volume_pounds": "743,552",

//{
//    "reportSection": "Current Volume",
//    "reportSections": [
//        "Summary",
//        "Current Cutout Values",
//        "Change From Prior Day",
//        "Composite Primal Values",
//        "Current Volume",
//        "Choice Cuts",
//        "Select Cuts",
//        "Choice and Select Cuts",
//        "Ground Beef",
//        "Blended Ground Beef",
//        "Beef Trimmings"
//    ],
//    "stats": {
//        "totalRows:": 1,
//        "returnedRows:": 1,
//        "userAllowedRows:": 99999
//    },
//    "results": [
//        {
//            "report_date": "06/17/2022",
//            "narrative": null,
//            "trend": null,
//            "choice_volume_loads": "70.76",
//            "select_volume_loads": "19.62",
//            "trimmings_volume_loads": "8.38",
//            "coarse_volume_loads": "7.64",
//            "choice_volume_pounds": "2,830,336",
//            "select_volume_pounds": "784,895",
//            "trimmings_volume_pounds": "335,362",
//            "coarse_volume_pounds": "305,756",


//            "report_title": "National Daily Boxed Beef Cutout & Boxed Beef Cuts - Negotiated Sales - PM (PDF) (LM_XB403)",
//            "slug_name": "AMS_2453",
//            "slug_id": "2453",
//            "office_name": "Des Moines, IA",
//            "office_code": "LS-NW",
//            "office_city": "Des Moines",
//            "office_state": "IA",
//            "market_location_name": "Des Moines, IA",
//            "market_location_city": "Des Moines",
//            "market_location_state": "IA",
//            "market_type": "Direct Livestock - LMR Beef",
//            "market_type_category": "Direct Livestock - LMR Beef",
//            "published_date": "06/17/2022 14:49:06"
//        }
//    ]
//}
