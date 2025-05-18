//
//  ViewController.swift
//  dz-8Counter
//
//  Created by Кирилл Антоненко on 18.05.2025.
//

import UIKit

class ViewController: UIViewController {
    private var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Background.backgroundColor = .lightGray
        
        NameProgram.text = "Counter"
        NameProgram.textAlignment = .center
        NameProgram.textColor = .red
        NameProgram.backgroundColor = .systemBlue
        NameProgram.layer.masksToBounds = true
        NameProgram.layer.cornerRadius = 10
        NameProgram.font = .boldSystemFont(ofSize: 30)
        
        Counter.text = String(count)
        Counter.textColor = .blue
        Counter.font = .boldSystemFont(ofSize: 42)
        Counter.textAlignment = .center
        
        
    }

    // Оутлеты для обращения к элементам холста
    @IBOutlet var Background: UIView!
    @IBOutlet weak var Counter: UILabel!
    @IBOutlet weak var NameProgram: UILabel!
    
    // Функции обработки нажатия кнопок
    @IBAction func plusCounter(_ sender: Any) {
        count += 1
        Counter.text = String(count)
    }
    
    @IBAction func minusCounter(_ sender: Any) {
        count -= 1
        Counter.text = String(count)
    }
}
