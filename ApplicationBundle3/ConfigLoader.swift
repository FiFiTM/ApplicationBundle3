//
//  ConfigLoader.swift
//  ApplicationBundle3
//
//  Created by Bartosz Pabian on 20/07/2025.
//

import UIKit

class ConfigLoader {
    static func loadConfig() throws -> AppConfig {
        guard let url = Bundle.main.url(forResource: "config", withExtension: "json") else {
            throw ConfigError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(AppConfig.self, from: data)
        } catch {
            throw ConfigError.decodingFailed(error)
        }
    }

    enum ConfigError: Error {
        case fileNotFound
        case decodingFailed(Error)
    }
}

