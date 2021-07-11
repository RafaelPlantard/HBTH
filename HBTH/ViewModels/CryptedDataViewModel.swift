//
//  CryptedDataViewModel.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

import struct Foundation.Data

struct CryptedDataViewModel: Unlockable {
    let dataEncrypted: String

    // MARK: - Unlockable conforms

    func decrypt() -> UncryptedDataViewModel? {
        guard let passcodeData = Data(base64Encoded: dataEncrypted),
              let dataUncrypted = String(data: passcodeData, encoding: .utf8)else {
            return nil
        }

        return UncryptedDataViewModel(dataUncrypted: dataUncrypted)
    }
}
