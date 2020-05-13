//
//  EventCell.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import UIKit
import MVVMKit

protocol EventCellDelegate: class {
    func eventCell(_ eventCell: EventCell, didUpdate favorite: Bool)
}

class EventCell: UITableViewCell, CustomBinder, CustomDelegator {
    typealias Delegate = EventCellDelegate
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    func bind(viewModel: EventCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        favoriteButton.isSelected = viewModel.isFavorite
    }
    
    @IBAction private func favoriteButtonDidTap() {
        favoriteButton.isSelected.toggle()
        delegate?.eventCell(self, didUpdate: favoriteButton.isSelected)
    }
}
