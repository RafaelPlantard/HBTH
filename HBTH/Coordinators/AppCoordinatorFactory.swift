//
//  AppCoordinatorFactory.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

import class UIKit.UINavigationController

enum AppCoordinatorFactory {
    static func make(navigationController: UINavigationController) -> Coordinator {
        AppCoordinator(navigationController: navigationController, repository: PageRepositoryFactory.make())
    }
}
