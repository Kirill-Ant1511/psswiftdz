//
//  Models.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 21.05.2025.
//

import Foundation
import UIKit

struct IconModel: Codable {
    var icon: String
}

struct CurrentModel: Codable {
    var temp: Double
}

struct WeatherResponse: Codable {
    var name: String
    var main: CurrentModel
    var weather: [IconModel]
}

