//
//  WeatherAppController.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 19.05.2025.
//

import Foundation
import UIKit

// Класс для View Controller
class WeatherAppController: UIViewController {
    // Замыкание для получения свежих данных о погоде и получения этого замыкания в Navigation Controller
    var onButtonRequestRefresh: (() -> Void)?
    
    // Переменная для отображения локации
    var location: String? {
        // didSet который меняет значение в указанном поле когда меняется сама переменная
        didSet {
            guard let location = self.location else {
                return
            }
            self.locationLabel.text = self.location
        }
    }
    
    // Оутлет для вывода локации
    @IBOutlet private weak var locationLabel: UILabel!
    
    // Переменная для вывода температуры
    var temperature: Int? {
        didSet {
            guard let temperature = self.temperature else {
                return
            }
            self.temperatureLabel.text = "\(temperature)°C"
        }
    }
    
    //Оутлет для вывода температуры
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    // Обработка нажатия на кнопку
    @IBAction private func didRequestRefreshButton(_ sender: Any) {
        self.onButtonRequestRefresh?()
    }
    
    var image: UIImage? {
        didSet {
            guard let image = self.image else {return}
            imageView.image = image
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
}
