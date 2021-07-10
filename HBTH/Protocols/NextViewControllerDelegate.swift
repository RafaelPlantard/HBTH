//
//  NextViewControllerDelegate.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import class UIKit.UIViewController

protocol NextViewControllerDelegate: AnyObject {
    func goNext(from viewController: UIViewController)
}
