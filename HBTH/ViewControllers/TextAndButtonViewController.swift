//
//  TextAndButtonViewController.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import KeyboardLayoutGuide
import UIKit

final class TextAndButtonViewController: ImageBackgroundViewController {
    private lazy var descriptionTextView: UITextView = {
        let textView = VerticallyCenteredTextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textView.textAlignment = .center

        return textView
    }()

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

    // MARK: - Initializer

    init(description: String, image: UIImage, button: String) {
        super.init(image: image)

        nextButtonAction.title = button
        descriptionTextView.text = description
    }

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
        view.addSubview(descriptionTextView)
        view.addSubview(nextButton)
    }

    private func setupConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            nextButton.topAnchor.constraint(lessThanOrEqualTo: descriptionTextView.bottomAnchor, constant: 16),
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
