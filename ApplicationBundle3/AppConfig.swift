//
//  AppConfig.swift
//  ApplicationBundle3
//
//  Created by Bartosz Pabian on 11/07/2025.
//

import Foundation

struct AppConfig: Decodable {
    let numberOfImagesToShow: Int
    let imageNames: [String]
    let layoutStyle: String
    let spacing: Int
}

