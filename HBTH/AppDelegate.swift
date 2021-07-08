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

    // MARK: - UIApplicationDelegate conforms

    func applicationDidFinishLaunching(_ application: UIApplication) {
        let app = UIWindow(frame: UIScreen.main.bounds)
        app.backgroundColor = .systemBackground
        app.rootViewController = HomeViewController()
        app.makeKeyAndVisible()

        window = app
    }
}

