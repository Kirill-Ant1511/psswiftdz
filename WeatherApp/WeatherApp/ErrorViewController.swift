//
//  ErrorViewController.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 19.05.2025.
//

import Foundation
import UIKit

class ErrorViewController : UIViewController {
    
    var message: String? {
        didSet {
            guard let message = self.message else {
                return
            }
            self.messageLabel.text = message
        }
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBAction private func didOpenSettingButton(_ sender: Any) {
        self.didRequestOpenSettings?()
    }
    
    var didRequestOpenSettings: (() -> Void)?
    
    var buttonTitleText: String? {
        didSet {
            guard let buttonTitleText = self.buttonTitleText else {
                return
            }
            self.buttonTitle.setTitle(buttonTitleText, for: [])
        }
    }
    
    @IBOutlet weak var buttonTitle: UIButton!
}
