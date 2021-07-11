//
//  AppDelegate.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // MARK: - Private variables

    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)

        return navigationController
    }()

    // MARK: - Private lazy variables

    private lazy var coordinator: Coordinator = AppCoordinatorFactory.make(navigationController: navigationController)

    // MARK: - UIApplicationDelegate conforms

    func applicationDidFinishLaunching(_ application: UIApplication) {
        let app = UIWindow(frame: UIScreen.main.bounds)
        app.backgroundColor = .systemBackground
        app.rootViewController = navigationController
        coordinator.start()
        app.makeKeyAndVisible()

        window = app
    }
}

