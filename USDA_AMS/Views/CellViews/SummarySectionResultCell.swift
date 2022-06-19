//
//  SummarySectionResultCell.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation
import UIKit

class SummarySectionResultCell: UITableViewCell {
    // MARK: - Properties
    var viewModel: SummarySectionResultCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            reportTitleLabel.text = viewModel.reportTitleLabelString
            reportDateLabel.text = viewModel.reportDateLabelString
            trendLabel.text = viewModel.trendLabelString
            marketTypeLabel.text = viewModel.marketTypeLabelString
        }
    }
    
    private let reportTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    private let reportDateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let trendLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 8
        return label
    }()
    
    private let marketTypeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configureView() {
        
        contentView.addSubview(reportTitleLabel)
        reportTitleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 60)
        
        contentView.addSubview(reportDateLabel)
        reportDateLabel.anchor(top: reportTitleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        contentView.addSubview(marketTypeLabel)
        marketTypeLabel.anchor(top: reportDateLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 30)
        
        contentView.addSubview(trendLabel)
        trendLabel.anchor(top: marketTypeLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 140)
    }
}
