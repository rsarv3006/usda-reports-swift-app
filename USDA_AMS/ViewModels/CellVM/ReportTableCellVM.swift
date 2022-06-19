//
//  ReportTableCellViewModel.swift
//  USDA_AMS
//
//  Created by rjs on 6/4/22.
//

import Foundation

struct ReportTableCellVM {
    
    init(withReport report: ReportModel) {
        reportTitle = ReportModelHelpers.splitReportTitle(title: report.report_title)
        
        reportPublishDateString = ReportModelHelpers.removeTimefromPublishedDate(publishedDate: report.published_date)
    }
    
    // MARK: Properties
    var reportTitle: String
    
    var reportPublishDateString: String = ""
    
}
