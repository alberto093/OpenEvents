//
//  EventDetailViewModel.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import Foundation
import MVVMKit

class EventDetailViewModel: ReferenceViewModel {
    private let event: Event
    
    var title: String {
        event.name
    }
    
    var subtitle: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        return formatter.string(from: event.date)
    }
    
    var progressDescription: String {
        event.status.rawValue.localizedCapitalized
    }
    
    var progress: Float {
        switch event.status {
        case .scheduled:
            return 0.15
        case .running:
            return 0.5
        case .completed:
            return 1
        }
    }
    
    init(event: Event) {
        self.event = event
    }
}
