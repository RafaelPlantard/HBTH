//
//  PageToViewControllerTransformer.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

import class UIKit.UIViewController

struct PageToViewControllerTransformer {
    let page: PageViewModel

    // MARK: - Functions

    func get(delegate: InputTextReceivedOnViewControllerDelegate & NextViewControllerDelegate) -> UIViewController {
        guard let text = page.text else {
            let viewController = HomeViewController(image: page.image)
            viewController.delegate = delegate

            return viewController
        }

        if page.cryptedDataViewModel != nil {
            let viewController = InputPasscodeViewController(description: text, image: page.image)
            viewController.delegate = delegate

            return viewController
        }

        let viewController = TextAndButtonViewController(
            description: text, image: page.image, button: page.button ?? "Entrar"
        )
        viewController.delegate = delegate

        return viewController
    }
}
