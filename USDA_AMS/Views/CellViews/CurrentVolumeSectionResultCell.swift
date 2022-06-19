//
//  CurrentVolumeSectionResultCell.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation
import UIKit

class CurrentVolumeSectionResultCell: UITableViewCell {
    // MARK: - Properties
    var viewModel: CurrentVolumeSectionResultCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            populateLabels(viewModel: viewModel)
        }
    }
    
    var reportTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    var reportDateLabel: UILabel = { return UILabel() }()
    
    var marketTypeLabel: UILabel = { return UILabel() }()
    
    var choiceVolumeLabel: UILabel = { return UILabel() }()
    
    var selectVolumeLabel: UILabel = { return UILabel() }()
    
    var coarseVolumeLabel: UILabel = { return UILabel() }()
    
    var trimmingsVolumeLabel: UILabel = { return UILabel() }()
    
    var choiceVolumeValueLabel: UILabel = { return UILabel() }()
    
    var selectVolumeValueLabel: UILabel = { return UILabel() }()
    
    var coarseVolumeValueLabel: UILabel = { return UILabel() }()
    
    var trimmingsVolumeValueLabel: UILabel = { return UILabel() }()
    
    var nationalVolumeLabel: UILabel = { return UILabel() }()
    var nationVolumeValueLabel: UILabel = { return UILabel() }()
    
    var centralVolumeLabel: UILabel = { return UILabel() }()
    var centralVolumeValueLabel: UILabel = { return UILabel() }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func populateLabels(viewModel: CurrentVolumeSectionResultCellVM) {
        reportTitleLabel.text = viewModel.reportTitleLabelString
        reportDateLabel.text = viewModel.reportDateLabelString
        marketTypeLabel.text = viewModel.marketTypeLabelString
        
        choiceVolumeLabel.text = viewModel.choiceVolumeLabelString
        selectVolumeLabel.text = viewModel.selectVolumeLabelString
        coarseVolumeLabel.text = viewModel.coarseVolumeLabelString
        trimmingsVolumeLabel.text = viewModel.trimmingsVolumeLabelString
        
        choiceVolumeValueLabel.text = viewModel.choiceVolumeValue
        selectVolumeValueLabel.text = viewModel.selectVolumeValue
        coarseVolumeValueLabel.text = viewModel.coarseVolumeValue
        trimmingsVolumeValueLabel.text = viewModel.trimmingsVolumeValue
        
        nationalVolumeLabel.text = viewModel.nationalVolumeLabelString
        nationVolumeValueLabel.text = viewModel.nationalVolumeValue
        
        centralVolumeLabel.text = viewModel.centralVolumeLabelString
        centralVolumeValueLabel.text = viewModel.centralVolumeValue
        
    }
    
    func configureView() {
        addSubview(reportTitleLabel)
        reportTitleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 60)
        
        addSubview(reportDateLabel)
        reportDateLabel.anchor(top: reportTitleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(marketTypeLabel)
        marketTypeLabel.anchor(top: reportDateLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(choiceVolumeLabel)
        choiceVolumeLabel.anchor(top: marketTypeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(choiceVolumeValueLabel)
        choiceVolumeValueLabel.anchor(top: choiceVolumeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(selectVolumeLabel)
        selectVolumeLabel.anchor(top: choiceVolumeValueLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(selectVolumeValueLabel)
        selectVolumeValueLabel.anchor(top: selectVolumeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(coarseVolumeLabel)
        coarseVolumeLabel.anchor(top: selectVolumeValueLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(coarseVolumeValueLabel)
        coarseVolumeValueLabel.anchor(top: coarseVolumeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(trimmingsVolumeLabel)
        trimmingsVolumeLabel.anchor(top: coarseVolumeValueLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(trimmingsVolumeValueLabel)
        trimmingsVolumeValueLabel.anchor(top: trimmingsVolumeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        addSubview(nationalVolumeLabel)
        nationalVolumeLabel.anchor(top: trimmingsVolumeValueLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)

        addSubview(nationVolumeValueLabel)
        nationVolumeValueLabel.anchor(top: nationalVolumeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)

        addSubview(centralVolumeLabel)
        centralVolumeLabel.anchor(top: nationVolumeValueLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)

        addSubview(centralVolumeValueLabel)
        centralVolumeValueLabel.anchor(top: centralVolumeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
    }
}
