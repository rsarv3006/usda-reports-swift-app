//
//  ReportTableView.swift
//  USDA_AMS
//
//  Created by rjs on 6/2/22.
//

import Foundation
import UIKit
import Combine

let REPORT_REUSE_IDENTIFIER = "reportTableViewCell"

class ReportTableView: UITableViewController {
    // MARK: Properties
    private var subscriptions = Set<AnyCancellable>()
    
    private var viewModel: ReportTableVM?
    
    private var reports = [ReportModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Lifecycle
    override init(style: UITableView.Style) {
        super.init(style: style)
        viewModel = ReportTableVM()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCombine()
        configureView()
        configureTableView()
        viewModel?.requestReports()
    }
    
    // MARK: Helpers
    func configureView() {
        self.title = "Reports"
    }
    
    func configureCombine() {
        viewModel?.reports.receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] incomingReports in
                guard let self = self else { return }
                self.reports = incomingReports
            }).store(in: &subscriptions)
    }
    
    func configureTableView() {
        tableView.register(ReportTableViewCell.self, forCellReuseIdentifier: REPORT_REUSE_IDENTIFIER)
        tableView.rowHeight = 80
        tableView.separatorStyle = .singleLine
    }
}

// MARK: UITableView
extension ReportTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: REPORT_REUSE_IDENTIFIER, for: indexPath) as! ReportTableViewCell
        cell.viewModel = ReportTableCellVM(withReport: (reports[indexPath.row]))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reportViewVC = ReportView()
        reportViewVC.viewModel = ReportViewVM(withReport: reports[indexPath.row])
        navigationController?.pushViewController(reportViewVC, animated: false)
    }
}
