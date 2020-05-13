//
//  EventListViewModel.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import UIKit
import MVVMKit

class EventListViewModel: TableViewViewModel {
    
    // MARK: - Model
    private var events: [Event]
    
    // MARK: - MVVM Requirements
    private(set) var sections: [SectionViewModel] = []
    var binder: AnyTableViewBinder<EventListViewModel>?
    let coordinator: DefaultCoordinator
    
    var numberOfFavorites: Int {
        events.filter(\.isFavorite).count
    }
    
    init(events: [Event] = [], coordinator: DefaultCoordinator) {
        self.events = events.sorted()
        self.coordinator = coordinator
        updateSections()
    }
    
    // MARK: - Public methods
    func fetchEvents() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://www.mocky.io/v2/5ebbca11360000070df7e9cb")!) { [weak self] data, _, _ in
            
            let decoder = JSONDecoder.dateDecoder
            let events = data.map { try? decoder.decode([Event].self, from: $0).sorted() } ?? []
            self?.events = events ?? []
            DispatchQueue.main.async {
                self?.updateSections()
            }
        }

        task.resume()
    }
    
    func updateEvent(at index: Int, isFavorite: Bool) {
        guard events.indices.contains(index) else { return }
        events[index].isFavorite = isFavorite
        updateSections()
    }
    
    func selectEvent(at index: Int) {
        guard events.indices.contains(index) else { return }
        coordinator.showEventDetailViewController(with: events[index])
    }
    
    // MARK: - Private methods
    private func updateSections() {
        sections = [SectionViewModel(cellViewModels: events.map(EventCellViewModel.init))]
        binder?.bind(viewModel: self, update: .reloadData)
    }
}

private extension Coordinator {
    func showEventDetailViewController(with event: Event) {
        let detailViewController: EventDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EventDetailViewController")
        detailViewController.viewModel = EventDetailViewModel(event: event)
        viewController?.show(detailViewController, sender: nil)
    }
}
