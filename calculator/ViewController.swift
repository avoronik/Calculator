//
//  ViewController.swift
//  calculator
//
//  Created by Apple on 26.02.24.
//

import UIKit

//TODO: доделать калькулятор
enum Operation {
    case none
    case sum
    case substraction
    case division
    case multiplication
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultText: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    
    var state: Operation = .none
    
    var firstValue: Int = 0
    var secondValue: Int = 0
    
    //   var divValue1: Double = 0
    //   var divValue2: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualSetup()
//        print(visualSetupButtons(buttons: buttons))
        
    }
    
    //        buttons.forEach({ $0.backgroundColor = .red })
    
    
    
    @IBAction func sendValue(_ sender: UIButton) {
        guard var value = resultText.text else { return }
        value += "\(sender.tag)"
        resultText.text = value
    }
    
    @IBAction func comma(_ sender: UIButton) {
        guard var value = resultText.text else { return }
        
        value += ","
        resultText.text = value
        
        sender.isEnabled = false
    }
    
    @IBAction func sumOperation(_ sender: Any) {
        guard let value = resultText.text else { return }
        firstValue = Int(value) ?? 0
        state = .sum
        resultText.text = ""
    }
    
    @IBAction func subOperation(_ sender: Any) {
        guard let value = resultText.text else { return }
        firstValue = Int(value) ?? 0
        state = .substraction
        resultText.text = ""
    }
    
    @IBAction func multiOperation(_ sender: Any) {
        guard let value = resultText.text else { return }
        firstValue = Int(value) ?? 0
        state = .multiplication
        resultText.text = ""
    }
    
    @IBAction func divOperation(_ sender: Any)  {
        guard let value = resultText.text else { return }
        firstValue = Int(value) ?? 0
        state = .division
        resultText.text = ""
    }
    
    @IBAction func resultAction(_ sender: Any) {
        guard let value = resultText.text else { return }
        secondValue = Int(value) ?? 0
        
        switch state {
        case .none:
            break
        case .sum:
            let result = firstValue + secondValue
            resultText.text = "\(result)"
        case .substraction:
            let result = firstValue - secondValue
            resultText.text = "\(result)"
        case .division:
            let result: Double = Double(firstValue) / Double(secondValue)
            resultText.text = "\(result)"
        case .multiplication:
            let result = firstValue * secondValue
            resultText.text = "\(result)"
        }
    }
    
    @IBAction func cleanAll(_ sender: UIButton) {
        resultText.text = ""
    }
    
    func visualSetup() {
        for view in buttons {
            view.layer.cornerRadius = 40
            
        }
        resultText.font = .systemFont(ofSize: 70)
        resultText.textAlignment = .right
        
    }
    
//    func visualSetupButtons(buttons: [UIButton]) -> [UIButton] {
//        if buttons.isEmpty {
//            print("empty")
//        } else {
//            for button in buttons {
//                button.translatesAutoresizingMaskIntoConstraints = false
//                //            button.titleLabel?.font = .systemFont(ofSize: 60)
//                button.titleLabel?.font = .italicSystemFont(ofSize: 65)
//                
//            }
//        }
//        return buttons
//    }
}
