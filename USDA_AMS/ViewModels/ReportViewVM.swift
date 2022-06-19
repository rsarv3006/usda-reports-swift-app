//
//  ReportViewVM.swift
//  USDA_AMS
//
//  Created by rjs on 6/15/22.
//

import Foundation

struct ReportViewVM {
    // MARK: - Properties
    var reportDateForQuery: String
    
    var reportTitle: String
    
    var reportDateString: String
    
    var marketType: String
    
    var officeLocationString: String
    
    var sectionNames: [String]
    
    var slugId: Int
    
    // MARK: - Lifecycle
    init(withReport report: ReportModel) {
        reportDateForQuery = ReportModelHelpers.removeTimefromPublishedDate(publishedDate: report.published_date)
        reportTitle = "Report Title: \(ReportModelHelpers.splitReportTitle(title: report.report_title))"
        reportDateString = "Published Date: \(reportDateForQuery)"
        marketType = "Market Type: \(report.market_types[0])"
        officeLocationString = "Office Location: \(report.offices[0])"
        sectionNames = report.sectionNames
        slugId = report.slug_id
    }
}
