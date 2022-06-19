//
//  ReportTableViewModel.swift
//  USDA_AMS
//
//  Created by rjs on 6/4/22.
//

import Foundation
import Combine
import Alamofire

class ReportTableVM {
    private var subscriptions = Set<AnyCancellable>()

    var reports = PassthroughSubject<[ReportModel], Never>()
    
    // MARK: Lifecycle
    init() {
    }
    
    // MARK: - Helpers
    func requestReports() {
        UsdaService.fetchAllReportsList()
            .sink { error in
                print(error)
            } receiveValue: { incomingReports in
                self.reports.send(incomingReports)
            }
            .store(in: &subscriptions)
    }

}
