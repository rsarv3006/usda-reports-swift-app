//
//  ReportSectionSummaryView.swift
//  USDA_AMS
//
//  Created by rjs on 6/17/22.
//

import Foundation
import UIKit
import Combine

private let SUMMARY_SECTION_REUSE_ID = "SUMMARY_SECTION_REUSE_ID"

class ReportSectionSummaryTableView: UITableViewController {
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    var viewModel: ReportSectionSummaryViewVM? {
        didSet {
            guard let viewModel = viewModel else { return }

            navigationItem.title = viewModel.sectionTitle
        }
    }
    
    private var results = [ReportSectionSummaryResultModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCombine()
        configureTableView()
        
    }
    
    // MARK: - Helpers
    func configureView() {
        self.title = viewModel?.sectionTitle
    }
    
    func configureTableView() {
        tableView.register(SummarySectionResultCell.self, forCellReuseIdentifier: SUMMARY_SECTION_REUSE_ID)
//        tableView.rowHeight = 260
        tableView.separatorStyle = .singleLine
    }
    
    func configureCombine() {
        viewModel?.section.receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] incomingSection in
                print("DEBUG: In sink for section")
                guard let self = self else { return }
                self.results = incomingSection.results
            }).store(in: &subscriptions)
        viewModel?.fetchSummarySection()
    }
}

// MARK: UITableView
extension ReportSectionSummaryTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SUMMARY_SECTION_REUSE_ID, for: indexPath) as! SummarySectionResultCell
        cell.viewModel = SummarySectionResultCellVM(withResult: results[indexPath.row])
        return cell
    }
}
