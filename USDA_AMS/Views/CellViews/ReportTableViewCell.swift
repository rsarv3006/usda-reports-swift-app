//
//  ReportTableViewCell.swift
//  USDA_AMS
//
//  Created by rjs on 6/4/22.
//

import Foundation
import UIKit

class ReportTableViewCell: UITableViewCell {
    // MARK: Properties
    var viewModel: ReportTableCellVM? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            reportTitleLabel.text = viewModel.reportTitle
            reportTitleLabel.sizeToFit()
            publishDateLabel.text = viewModel.reportPublishDateString
        }
    }
    
    let reportTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    let publishDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    func configureView() {
        contentView.addSubview(reportTitleLabel)
        reportTitleLabel.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 6, paddingLeft: 6)
        
        contentView.addSubview(publishDateLabel)
        publishDateLabel.anchor(top: reportTitleLabel.bottomAnchor, left: self.leftAnchor, paddingTop: 6, paddingLeft: 6)
    }
}
