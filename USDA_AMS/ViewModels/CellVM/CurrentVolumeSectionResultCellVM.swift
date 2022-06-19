//
//  CurrentValueSectionResultCellVM.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation

struct CurrentVolumeSectionResultCellVM {
    var reportTitleLabelString: String
    var reportDateLabelString: String
    var marketTypeLabelString: String
    
    let choiceVolumeLabelString = "Choice Volume (Loads/Pounds)"
    let selectVolumeLabelString = "Select Volume (Loads/Pounds)"
    let coarseVolumeLabelString = "Coarse Volume (Loads/Pounds)"
    let trimmingsVolumeLabelString = "Trimmings Volume (Loads/Pounds)"
    
    let centralVolumeLabelString = "Central Volume (Loads/Pounds)"
    let nationalVolumeLabelString = "National Volume (Loads/Pounds)"
    
    var choiceVolumeValue: String
    var selectVolumeValue: String
    var coarseVolumeValue: String
    var trimmingsVolumeValue: String
    
    var centralVolumeValue: String
    var nationalVolumeValue: String
    
    init(withResult result: ReportSectionCurrentVolumeResultModel) {
        self.reportTitleLabelString = result.report_title
        self.reportDateLabelString = result.published_date
        self.marketTypeLabelString = result.market_type
        
        self.choiceVolumeValue = CurrentVolumeSectionResultCellVM.createVolumeValueString(value1: result.choice_volume_loads, value2: result.choice_volume_pounds)
        
        self.selectVolumeValue = CurrentVolumeSectionResultCellVM.createVolumeValueString(value1: result.select_volume_loads, value2: result.select_volume_pounds)
        
        self.coarseVolumeValue = CurrentVolumeSectionResultCellVM.createVolumeValueString(value1: result.coarse_volume_loads, value2: result.coarse_volume_pounds)
        
        self.trimmingsVolumeValue = CurrentVolumeSectionResultCellVM.createVolumeValueString(value1: result.trimmings_volume_loads, value2: result.trimmings_volume_pounds)
        
        self.centralVolumeValue = CurrentVolumeSectionResultCellVM.createVolumeValueString(value1: result.central_volume_loads, value2: result.central_volume_pounds)
        
        self.nationalVolumeValue = CurrentVolumeSectionResultCellVM.createVolumeValueString(value1: result.national_volume_loads, value2: result.national_volume_pounds)
        
    }
    
    private static func createVolumeValueString(value1: String?, value2:String?) -> String {
        if let value1 = value1, let value2 = value2 {
            return "\(value1) / \(value2)"
        } else if let value1 = value1 {
            return value1
        } else if let value2 = value2 {
            return value2
        }
        
        return ""
    }
}
