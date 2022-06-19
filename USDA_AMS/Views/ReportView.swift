//
//  ReportView.swift
//  USDA_AMS
//
//  Created by rjs on 6/15/22.
//

import Foundation
import UIKit

private let SECTION_NAME_CELL_IDENTIFIER = "section_name_cell"

class ReportView: UIViewController {
    // MARK: - Properties
    var viewModel: ReportViewVM? {
        didSet {
            reportTitleLabel.text = viewModel?.reportTitle
            reportDateLabel.text = viewModel?.reportDateString
            marketTypesLabel.text = viewModel?.marketType
            officeUILabel.text = viewModel?.officeLocationString
            sectionTableView.reloadData()
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
    
    private let marketTypesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let officeUILabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let sectionTableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
    }
    
    // MARK: - Helpers
    func configureView() {
        view.addSubview(reportTitleLabel)
        reportTitleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 4, height: 50)
        
        view.addSubview(reportDateLabel)
        reportDateLabel.anchor(top: reportTitleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 4, height: 30)
        
        view.addSubview(marketTypesLabel)
        marketTypesLabel.anchor(top: reportDateLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 4, height: 30)
        
        view.addSubview(officeUILabel)
        officeUILabel.anchor(top: marketTypesLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 4, height: 30)
        
        view.addSubview(sectionTableView)
        sectionTableView.anchor(top: officeUILabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 4)
    }
    
    func configureTableView() {
        sectionTableView.register(UITableViewCell.self, forCellReuseIdentifier: SECTION_NAME_CELL_IDENTIFIER)
        
        sectionTableView.delegate = self
        sectionTableView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate
extension ReportView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ReportView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel?.sectionNames.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: SECTION_NAME_CELL_IDENTIFIER, for: indexPath)
        
        // Configure the cell’s contents.
        cell.textLabel!.text = viewModel?.sectionNames[indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let sectionName = viewModel?.sectionNames[indexPath.row], let reportDate = viewModel?.reportDateForQuery, let slugId = viewModel?.slugId {
            if sectionName == ReportSectionMap.summary.rawValue {
                let newVC = ReportSectionSummaryTableView()
                newVC.viewModel = ReportSectionSummaryViewVM(sectionTitle: sectionName, reportDate: reportDate, slugId: slugId)
                navigationController?.pushViewController(newVC, animated: false)
            } else if sectionName == ReportSectionMap.currentVolume.rawValue {
                let newVc = ReportSectionCurrentVolumeTableView()
                newVc.viewModel = ReportSectionCurrentVolumeViewVM(sectionTitle: sectionName, reportDate: reportDate, slugId: slugId)
                navigationController?.pushViewController(newVc, animated: false)
            } else {
                print("DEBUG: \(sectionName)")
            }
        }
        
    }
    
}
