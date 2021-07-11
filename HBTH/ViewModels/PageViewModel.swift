//
//  PageViewModel.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

import class UIKit.UIImage

struct PageViewModel {
    let button: String?
    let image: UIImage
    let text: String?
    let cryptedDataViewModel: CryptedDataViewModel?

    // MARK: - Initializers

    init(text: String? = nil, button: String, image: UIImage) {
        self.button = button
        self.image = image
        self.text = text
        self.cryptedDataViewModel = nil
    }

    init(text: String? = nil, passcode: String, image: UIImage) {
        self.button = nil
        self.image = image
        self.text = text
        self.cryptedDataViewModel = CryptedDataViewModel(dataEncrypted: passcode)
    }
}
