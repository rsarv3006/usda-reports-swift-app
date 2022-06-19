//
//  ReportSectionCurrentVolumeTableView.swift
//  USDA_AMS
//
//  Created by rjs on 6/18/22.
//

import Foundation
import UIKit
import Combine

private let CURRENT_VOLUME_REUSE_ID = "CURRENT_VOLUME_REUSE_ID"

class ReportSectionCurrentVolumeTableView: UITableViewController {
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    var viewModel: ReportSectionCurrentVolumeViewVM? {
        didSet {
            guard let viewModel = viewModel else { return }

            navigationItem.title = viewModel.sectionTitle
        }
    }
    
    private var results = [ReportSectionCurrentVolumeResultModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
        configureCombine()
        viewModel?.fetchCurrentVolumeSection()
    }
    
    // MARK: - Helpers
    func configureView() {
        self.title = viewModel?.sectionTitle
    }
    
    func configureTableView() {
        tableView.register(CurrentVolumeSectionResultCell.self, forCellReuseIdentifier: CURRENT_VOLUME_REUSE_ID)
//        tableView.rowHeight = 260
        tableView.separatorStyle = .singleLine
    }
    
    func configureCombine() {
        viewModel?.section.receive(on: DispatchQueue.main).sink(receiveValue: { [weak self] incomingSection in
            guard let self = self else { return }
            self.results = incomingSection.results
        }).store(in: &subscriptions)
    }
}

// MARK: UITableView
extension ReportSectionCurrentVolumeTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CURRENT_VOLUME_REUSE_ID, for: indexPath) as! CurrentVolumeSectionResultCell
        cell.viewModel = CurrentVolumeSectionResultCellVM(withResult: results[indexPath.row])
        return cell
    }
}

