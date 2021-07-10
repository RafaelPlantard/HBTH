//
//  InputTextReceivedOnViewControllerDelegate.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

import class UIKit.UIViewController

protocol InputTextReceivedOnViewControllerDelegate: AnyObject {
    func inputTextReceived<T: UIViewController>(text: String?, on viewController: T)
}
