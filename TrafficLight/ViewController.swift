//
//  ViewController.swift
//  TrafficLight
//
//  Created by Roman Dubovskoi on 7/5/24.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    let ternOnTheLight = 1.0
    let ternOffTheLight = 0.3
    
    private var currentLight = CurrentLight.red
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.layer.cornerRadius = 50
        redView.alpha = ternOffTheLight
        
        yellowView.layer.cornerRadius = 50
        yellowView.alpha = ternOffTheLight
        
        greenView.layer.cornerRadius = 50
        greenView.alpha = ternOffTheLight
        
        startButton.backgroundColor = .blue
        startButton.tintColor = .white
        startButton.layer.cornerRadius = 10
        startButton.setTitle("START", for: .normal)
    }
    
    
    @IBAction func startButtonDidTapped(_ sender: UIButton) {
        sender.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenView.alpha = ternOffTheLight
            redView.alpha = ternOnTheLight
            currentLight = .yellow
        case .yellow:
            redView.alpha = ternOffTheLight
            yellowView.alpha = ternOnTheLight
            currentLight = .green
        case .green:
            yellowView.alpha = ternOffTheLight
            greenView.alpha = ternOnTheLight
            currentLight = .red
        }
        
    }
    
}


extension ViewController {
    enum CurrentLight {
        case red
        case yellow
        case green
    }
}
