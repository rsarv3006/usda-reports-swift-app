//
//  LMPRS_Api.swift
//  USDA_AMS
//
//  Created by rjs on 6/1/22.
//

import Foundation
import Alamofire
import Combine
import UIKit

typealias ReportArray = [ReportModel]

struct UsdaService {
    private static let baseURL = "https://mpr.datamart.ams.usda.gov/services/v1.1/"
    
    static func getReportsList(completion: @escaping ([ReportModel]?) -> Void) {
        AF.request("https://mpr.datamart.ams.usda.gov/services/v1.1/reports?q=report_date=06/01/2022", method: .get)
            .validate()
            .responseDecodable(of: ReportArray.self) { response in
                guard let reportArray = response.value else {
                    completion(nil)
                    return
                }
                
                completion(reportArray)
            }
    }
    
    static func fetchAllReportsList(reportDate: Date = Date().yesterday) -> AnyPublisher<ReportArray, AFError> {
        
        return AF.request("\(baseURL)reports?q=report_date=\(reportDate.convertToString())", method: .get)
            .validate()
            .publishDecodable(type: ReportArray.self)
            .value()
    }
    
    static func fetchSummarySection(slugId: Int, reportDateString: String) -> AnyPublisher<ReportSectionSummaryModel, AFError> {
        let requestUrl = "\(baseURL)reports/\(String(slugId))/\(ReportSectionMap.summary.rawValue)?q=report_date=\(reportDateString)"
        return AF.request(requestUrl, method: .get)
            .validate()
            .publishDecodable(type: ReportSectionSummaryModel.self)
            .value()
    }
    
    static func fetchCurrentVolumeSection(slugId: Int, reportDateString: String) -> AnyPublisher<ReportSectionCurrentVolumeModel, AFError> {
        let requestUrl = "\(baseURL)reports/\(String(slugId))/Current%20Volume?q=report_date=\(reportDateString)"
        
        print("DEBUG: \(requestUrl)")
        return AF.request(requestUrl, method: .get)
            .validate()
            .publishDecodable(type: ReportSectionCurrentVolumeModel.self)
            .value()
    }
    
}
