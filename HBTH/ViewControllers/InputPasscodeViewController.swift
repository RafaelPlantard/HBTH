//
//  InputPasscodeViewController.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import KeyboardLayoutGuide
import UIKit

final class InputPasscodeViewController: ImageBackgroundViewController {
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textView.textAlignment = .center

        return textView
    }()

    private let inputPasscodeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Qual a senha encontrada?"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect

        return textField
    }()

    // MARK: - Initializer

    init(description: String, image: UIImage) {
        super.init(image: image)

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
        view.addSubview(inputPasscodeTextField)
    }

    private func setupConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        inputPasscodeTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            inputPasscodeTextField.topAnchor.constraint(lessThanOrEqualTo: descriptionTextView.bottomAnchor, constant: 16),
            inputPasscodeTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            inputPasscodeTextField.heightAnchor.constraint(equalToConstant: 44),
            inputPasscodeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputPasscodeTextField.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -16)
        ])
    }
}
