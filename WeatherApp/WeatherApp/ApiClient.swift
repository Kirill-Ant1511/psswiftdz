//
//  ApiClient.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 21.05.2025.
//

import Foundation
import CoreLocation
import Alamofire
import UIKit
// Клиент для получения погоды с помощью Alamofire
class ApiClient {
    private static let API_KEY = "70954f5d011a27543fd5403c822200d1"
    
    // https://api.weatherapi.com/v1/current.json?key=api_key&q=latitude,longitude ссылка для запроса к серверу
    
    func fetchWeather(for location: CLLocationCoordinate2D) async -> WeatherResponse? {
        //let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(Int(location.latitude))&lon=\(Int(location.longitude))&appid=\(Self.API_KEY)"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(Self.API_KEY)"
        do {
            print(urlString, location)
            let data = try await AF.request(urlString).serializingData().value // Выполнения запросы и получения данных
            
            let decoder = JSONDecoder() // Создание JSON декодера
            let result = try decoder.decode(WeatherResponse.self, from: data) // выполняем преобразование json формата который пришёл от сервера и записываем его вструктуру WeatherResponse
            return result
            
        } catch {
            return nil // Если возникает ошибка возвращаем nil
        }
    }
    
    func fetchIcon(withId id: String) async -> UIImage? {
        let urlString = "https://openweathermap.org/img/w/\(id).png"
        do {
            let data = try await AF.request(urlString).serializingData().value
            
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
}
