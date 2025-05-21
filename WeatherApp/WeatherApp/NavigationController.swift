//
//  NavigationController.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 19.05.2025.
//

import Foundation
import UIKit
import SwiftLocation
import CoreLocation
import Alamofire
class NavigationController: UINavigationController {
    
    // Обработчик состояния приложения
    var appState: AppState? {
        didSet {
            guard let appState = self.appState else { return }
            switch appState {
            case .getLocation:
                self.showProcess(withMessage: "Определяем ваше местоположение")
                Task {
                    let userLocation = await self.getLocation()
                    print(userLocation ?? "Not found")
                    DispatchQueue.main.async {
                        if let userLocation = userLocation {
                            self.appState = .getWeather(location: userLocation)
                        } else {
                            self.appState = .failedToGetLocation
                        }
                    }
                    
                }
                
            case .failedToGetLocation:
                self.showError(withMessage: "Не удалось определить ваше местоположение...", withButtonTitle: "Открыть настройки") {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }
                
            case .getWeather(let location):
                self.showProcess(withMessage: "Уточняем погоду для вышей локации...")
                Task {
                    let weather = await ApiClient().fetchWeather(for: location)
                    print(weather?.weather[0].icon ?? "Go fuck")
                    var image: UIImage?
                    if let weather = weather {
                        image = await ApiClient().fetchIcon(withId: weather.weather[0].icon)
                    } else {
                        print("Ошибка загрузки иконки")
                        self.appState = .failedToGetWeather
                    }
                    DispatchQueue.main.async {
                        if let weather = weather{
                            if let image = image {
                                self.appState = .weather(city: weather.name, temperature: Int(weather.main.temp) - 273, image: image)
                            } else {
                                print("Ошибка загрузки иконки после блядь её полуяения")
                                self.appState = .failedToGetWeather
                            }
                        } else {
                            print("Ошибка загрузки данных")
                            self.appState = .failedToGetWeather
                        }
                    }
                }
            case .failedToGetWeather:
                self.showError(withMessage: "Не удалось связаться с сервером", withButtonTitle: "Попробовать ещё раз") {
                    self.appState = .getLocation
                }
                
            case .weather(let city, let temperature, let image):
                self.showWeather(withTemperature: temperature, forLocation: city, withImage: image) {
                    self.appState = .getLocation
                }
                
            }
        
        }
    }
    
    private var location = Location()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.showWeather(withTemperature: 20, forLocation: "Sain-Petersburg") {
//            print("Refresh weather ")
//        }
//        self.showProcess(withMessage: "Загрузка...")
//        self.showError(withMessage: "Произошла ошибка. Повторите попытку позже", withButtonTitle: "Open Settings") {
//            print("Open settings")
//        }
        self.appState = .getLocation
    }
    
    func showWeather(withTemperature temperature: Int, forLocation location: String, withImage image: UIImage, onRequestRefresh: @escaping () -> Void) {
        // Получение View Controller из Storyboard
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherAppController else { return }
        // Загрузка View
        let _ = vc.view
        vc.image = image
        vc.location = location // Вывод локации
        vc.temperature = temperature // Вывод температуры
        vc.onButtonRequestRefresh = onRequestRefresh // Присвоение обработчика нажатия на кнопку
        self.viewControllers = [vc] // Установка как корневого контроллера
    }
    
    func showProcess(withMessage message: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProcessViewController") as? ProcessViewController else { return }
        let _ = vc.view
        vc.processMessage = message
        self.viewControllers = [vc]
    }
    
    func showError(withMessage message: String, withButtonTitle buttonTitle: String, onTapActionButton: @escaping () -> Void) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as? ErrorViewController else { return }
        let _ = vc.view
        vc.message = message
        vc.buttonTitleText = buttonTitle
        vc.didRequestOpenSettings = onTapActionButton
        self.viewControllers = [vc]
    }
    
    // Функци получения локации
    private func getLocation() async -> CLLocationCoordinate2D? {
        do {
            try await self.location.requestPermission(.whenInUse)
            let result = try await self.location.requestLocation().location?.coordinate
            
            return result
        } catch {
            return nil
        }
    }
}
