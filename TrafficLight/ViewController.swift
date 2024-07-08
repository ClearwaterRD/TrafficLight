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
    
    private let ternOnTheLight = 1.0
    private let ternOffTheLight = 0.3
    
    private var currentLight = CurrentLight.red
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = ternOffTheLight
        
        yellowView.alpha = ternOffTheLight
        
        greenView.alpha = ternOffTheLight
        
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = .blue
        startButton.tintColor = .white
        startButton.setTitle("START", for: .normal)
    }
   
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
   
    @IBAction func startButtonDidTapped() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
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
    private enum CurrentLight {
        case red
        case yellow
        case green
    }
}
