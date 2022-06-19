//
//  ReportSectionCurrentVolumeViewVM.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation
import Combine

class ReportSectionCurrentVolumeViewVM {
    private var subscriptions = Set<AnyCancellable>()
    private var reportDateForQuery: String
    private var slugId: Int
    
    var sectionTitle: String
    
    var section = PassthroughSubject<ReportSectionCurrentVolumeModel, Never>()
    
    // MARK: - Lifecycle
    init(sectionTitle: String, reportDate: String, slugId: Int) {
        self.sectionTitle = sectionTitle
        self.reportDateForQuery = reportDate
        self.slugId = slugId
    }
    
    func fetchCurrentVolumeSection() {
        UsdaService.fetchCurrentVolumeSection(slugId: slugId, reportDateString: reportDateForQuery)
            .sink { error in
                print(error)
            } receiveValue: { incomingSection in
                self.section.send(incomingSection)
            }
            .store(in: &subscriptions)

    }
    
}
