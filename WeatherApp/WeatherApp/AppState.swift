//
//  AppState.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 20.05.2025.
//

import Foundation
import CoreLocation
import UIKit

enum AppState {
    case getLocation // Получение кординат пользователя
    case failedToGetLocation // Ошибка при получении кординат пользователя
    case getWeather(location: CLLocationCoordinate2D) // Получение погоды по кординатам
    case failedToGetWeather // Ошибка получения погоды
    case weather(city: String, temperature: Int, image: UIImage) // Отображение погоды
}
