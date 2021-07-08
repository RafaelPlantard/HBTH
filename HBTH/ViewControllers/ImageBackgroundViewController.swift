//
//  ImageBackgroundViewController.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/7/21.
//

import UIKit

class ImageBackgroundViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    // MARK: - Initializer

    init(image: UIImage = #imageLiteral(resourceName: "marvel-step-4")) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
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
        view.addSubview(imageView)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
