//
//  HomeViewController.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import UIKit

final class HomeViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "marvel-step-4"))
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    // MARK: - Private lazy variables

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

    weak var delegate: ViewControllerDelegate?

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
        view.addSubview(imageView)
        view.addSubview(nextButton)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

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
