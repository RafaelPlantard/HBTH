//
//  HomeViewController.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import UIKit

final class HomeViewController: ImageBackgroundViewController {
    private lazy var nextButton: UIButton = {
        let button = UIButton(primaryAction: nextButtonAction)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 8

        return button
    }()

    private lazy var nextButtonAction = UIAction(title: "Entrar") { [weak self] _ in
        self?.goToNext()
    }

    // MARK: - Weak variables

    weak var delegate: NextViewControllerDelegate?

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Private functions

    private func setupView() {
        buildHierarchy()
        setupConstraints()
    }

    private func buildHierarchy() {
        view.addSubview(nextButton)
    }

    private func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            nextButton.heightAnchor.constraint(equalToConstant: 44),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func goToNext() {
        delegate?.goNext(from: self)
    }
}
