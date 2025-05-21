//
//  ProcessViewController.swift
//  WeatherApp
//
//  Created by Кирилл Антоненко on 19.05.2025.
//

import Foundation
import UIKit

class ProcessViewController: UIViewController {
    
    var processMessage: String? {
        didSet {
            guard let processMessage = self.processMessage else { return }
            self.processLabel.text = processMessage
        }
    }
    
    @IBOutlet private weak var processLabel: UILabel!
}
