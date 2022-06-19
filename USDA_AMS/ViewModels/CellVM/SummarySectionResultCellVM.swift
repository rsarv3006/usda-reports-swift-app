//
//  SummarySection.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation

struct SummarySectionResultCellVM {
    // MARK: - Properties
    var reportTitleLabelString: String
    
    var reportDateLabelString: String
    
    var trendLabelString: String
    
    var marketTypeLabelString: String
    
    // MARK: - Lifecycle
    init(withResult result: ReportSectionSummaryResultModel) {
        self.reportTitleLabelString = result.report_title
        self.reportDateLabelString = result.published_date
        self.trendLabelString = result.trend ?? ""
        self.marketTypeLabelString = result.market_type
    }
}
