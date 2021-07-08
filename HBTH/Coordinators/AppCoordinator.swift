//
//  AppCoordinator.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import class UIKit.UINavigationController
import class UIKit.UIViewController

final class AppCoordinator: Coordinator, ViewControllerDelegate {
    private weak var navigationController: UINavigationController?

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator conformance

    func start() {
        setupHome()
    }

    // MARK: - ViewControllerDelegate conformance

    func goNext(from viewController: UIViewController) {
        let description = "Uma boa música é constituída por teclas brancas e petras."
        let inputViewController = InputPasscodeViewController(description: description, image: #imageLiteral(resourceName: "marvel-step-1"))

        navigationController?.pushViewController(inputViewController, animated: true)
    }

    // MARK: - Private functions

    private func setupHome() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self

        navigationController?.setViewControllers([homeViewController], animated: false)
    }
}
