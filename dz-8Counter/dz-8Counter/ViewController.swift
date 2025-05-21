//
//  ViewController.swift
//  dz-8Counter
//
//  Created by Кирилл Антоненко on 18.05.2025.
//

import UIKit

class ViewController: UIViewController {
    private var count: Int = 0 {
        didSet {
            counterLabel.text = String(count)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        backgroundView.backgroundColor = .lightGray
        
        nameLabel.text = "Counter"
        nameLabel.textAlignment = .center
        nameLabel.textColor = .red
        nameLabel.backgroundColor = .systemBlue
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 10
        nameLabel.font = .boldSystemFont(ofSize: 30)
        
        counterLabel.text = String(count)
        counterLabel.textColor = .blue
        counterLabel.font = .boldSystemFont(ofSize: 42)
        counterLabel.textAlignment = .center
        
        
    }

    // Оутлеты для обращения к элементам холста
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // Функции обработки нажатия кнопок
    @IBAction func plusCounter(_ sender: Any) {
        count += 1
    }
    
    @IBAction func minusCounter(_ sender: Any) {
        count -= 1
    }
}
