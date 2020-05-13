//
//  EventDetailViewController.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import UIKit
import MVVMKit

class EventDetailViewController: UIViewController, ViewModelOwner {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var progressLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind(viewModel: EventDetailViewModel) {
        title = viewModel.title
        titleLabel.text = viewModel.subtitle
        progressLabel.text = viewModel.progressDescription
        progressView.setProgress(viewModel.progress, animated: true)
    }
}
