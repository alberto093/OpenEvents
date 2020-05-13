//
//  EventListViewController.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import UIKit
import MVVMKit

class EventListViewController: MVVMTableViewController<EventListViewModel> {
    private let footerLabel: UILabel = {
        let label = UILabel()
        label.frame.size.height = 80
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = footerLabel
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlDidChange), for: .valueChanged)
        tableView.refreshControl = refreshControl
        bind()
    }
    
    override func bind(viewModel: EventListViewModel) {
        tableView.refreshControl?.endRefreshing()
        footerLabel.text = "Favorites: \(viewModel.numberOfFavorites)"
        footerLabel.isHidden = viewModel.numberOfFavorites == 0
    }
    
    // MARK: - UIActions
    @objc private func refreshControlDidChange() {
        viewModel.fetchEvents()
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectEvent(at: indexPath.row)
    }
}

extension EventListViewController: EventCellDelegate {
    func eventCell(_ eventCell: EventCell, didUpdate favorite: Bool) {
        guard let indexPath = tableView.indexPath(for: eventCell) else { return }
        viewModel.updateEvent(at: indexPath.row, isFavorite: favorite)
    }
}
