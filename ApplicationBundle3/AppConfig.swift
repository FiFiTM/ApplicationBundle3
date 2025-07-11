//
//  AppConfig.swift
//  ApplicationBundle3
//
//  Created by Bartosz Pabian on 11/07/2025.
//

import UIKit

struct AppConfig: Decodable {
    let numberOfImagesToShow: Int
    let imagesNames: [String]
    let layoutStyle: String
    let spacing: Int
}

func loadConfig() -> AppConfig? {
    if let url = Bundle.main.url(forResource: "config", withExtension: "json") {
        print("Found config.json at: \(url)")
        
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            return try? decoder.decode(AppConfig.self, from: data)
        } else {
            print("Failed to load data from config.json")
        }
    } else {
        print("config.json NOT found in bundle")
    }
    return nil
}

func loadImages(from config: AppConfig) -> [UIImage] {
    let limitedNames = config.imagesNames.prefix(config.numberOfImagesToShow)
    return limitedNames.compactMap { UIImage(named: $0) }
}
