//
//  AppDelegate.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import UIKit
import MVVMKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    private func setupWindow() {
        let window = UIWindow()
        let viewController: EventListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EventListViewController")
        let coordinator = DefaultCoordinator(sourceViewController: viewController)
        viewController.viewModel = EventListViewModel(events: Event.mock, coordinator: coordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

