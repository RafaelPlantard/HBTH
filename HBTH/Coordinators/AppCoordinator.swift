//
//  AppCoordinator.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import PKHUD
import class UIKit.UINavigationController
import class UIKit.UIViewController

final class AppCoordinator: Coordinator, InputTextReceivedOnViewControllerDelegate, NextViewControllerDelegate {
    private weak var navigationController: UINavigationController?
    private let repository: PageRepositoryProtocol
    private var pages: IndexingIterator<[PageViewModel]>
    private var currentPage: PageViewModel?

    // MARK: - Initializer

    init(navigationController: UINavigationController, repository: PageRepositoryProtocol) {
        self.navigationController = navigationController
        self.repository = repository
        self.pages = repository.list().makeIterator()
    }

    // MARK: - Coordinator conformance

    func start() {
        currentPage = pages.next()

        if let page = currentPage {
            let viewController = PageToViewControllerTransformer(page: page).get(delegate: self)

            navigationController?.setViewControllers([viewController], animated: false)
        }
    }

    // MARK: - InputTextReceivedOnViewControllerDelegate conformance

    func inputTextReceived<T: UIViewController>(text: String?, on viewController: T) {
        if let passcodeTyped = text, let page = currentPage, let encrypted = page.cryptedDataViewModel,
           let decrypted = encrypted.decrypt(), passcodeTyped.count >= decrypted.dataUncrypted.count {
            guard passcodeTyped == decrypted.dataUncrypted else {
                return HUD.flash(.labeledError(title: "Evento Nexus", subtitle: "Variante detectada!"), delay: 4)
            }

            HUD.flash(
                .labeledSuccess(title: "Você está em um apocalipse", subtitle: "Evento Nexus indetectado"),
                onView: viewController.view, delay: 2,
                completion: { [weak self] isComplete in
                    self?.goNext(from: viewController)
                }
            )
        }
    }

    // MARK: - NextViewControllerDelegate conformance

    func goNext(from viewController: UIViewController) {
        currentPage = pages.next()

        if let page = currentPage {
            let viewController = PageToViewControllerTransformer(page: page).get(delegate: self)

            navigationController?.pushViewController(viewController, animated: true)
        } else {
            HUD.flash(
                .labeledSuccess(title: "É isso aí!", subtitle: "Te esperamos em Campos do Jordão amanhã!"), delay: 3
            )
        }
    }

    // MARK: - Private functions

    private func setupHome() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self

        navigationController?.setViewControllers([homeViewController], animated: false)
    }
}
