//
//  ImageLoader.swift
//  ApplicationBundle3
//
//  Created by Bartosz Pabian on 20/07/2025.
//

import UIKit

class ImageLoader {
    func loadImages(from config: AppConfig) -> [UIImage] {
        let limitedNames = config.imageNames.prefix(config.numberOfImagesToShow)
        return limitedNames.compactMap { name in
            if let image = UIImage(named: name) {
                print("Loaded image: \(name)")
                return image
            } else {
                print("Image not found: \(name)")
                return nil
            }
        }
    }
}
