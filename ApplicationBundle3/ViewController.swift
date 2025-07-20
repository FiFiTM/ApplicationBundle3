//
//  ViewController.swift
//  ApplicationBundle3
//
//  Created by Bartosz Pabian on 11/07/2025.
//

import UIKit

class ViewController: UIViewController {

    private let imageLoader = ImageLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        do {
            let config = try ConfigLoader.loadConfig()
            let images = imageLoader.loadImages(from: config)
            displayImages(images, spacing: config.spacing, layout: config.layoutStyle)
        } catch {
            print("Failed to load config: \(error)")
        }
    }

    private func displayImages(_ images: [UIImage], spacing: Int, layout: String) {
        let stackView = UIStackView()
        stackView.axis = layout.lowercased() == "horizontal" ? .horizontal : .vertical
        stackView.spacing = CGFloat(spacing)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        for image in images {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            imageView.setContentHuggingPriority(.defaultLow, for: .vertical)

            if stackView.axis == .vertical {
                imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
            } else {
                imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
            }

            stackView.addArrangedSubview(imageView)
        }

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}


