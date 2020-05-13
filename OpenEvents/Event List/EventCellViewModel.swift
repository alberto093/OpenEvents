//
//  EventCellViewModel.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import Foundation
import MVVMKit

struct EventCellViewModel: ReusableViewViewModel {
    let identifier = EventCell.identifier
    
    let title: String
    let subtitle: String
    let isFavorite: Bool
}

extension EventCellViewModel {
    init(event: Event) {
        title = event.name
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        subtitle = formatter.string(from: event.date)
        isFavorite = event.isFavorite
    }
}
