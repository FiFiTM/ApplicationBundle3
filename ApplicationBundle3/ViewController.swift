//
//  ViewController.swift
//  ApplicationBundle3
//
//  Created by Bartosz Pabian on 11/07/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let config = loadConfig() {
            let images = loadImages(from: config)
            displayImages(images, spacing: config.spacing)
        }
    }

    func displayImages(_ images: [UIImage], spacing: Int) {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = CGFloat(spacing)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill

        for image in images {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true

            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
            ])

            stackView.addArrangedSubview(imageView)
        }

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

#Preview {
    ViewController()
}

