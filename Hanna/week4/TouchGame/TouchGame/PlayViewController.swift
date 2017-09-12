//
//  PlayViewController.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 11..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var buttons = [UIButton]()
    var playing: Bool = false {
        didSet {
            switch playing {
            case true:
                startButton.isHidden = true
                historyButton.isEnabled = false
                historyButton.alpha = 0.6
            case false:
                startButton.isHidden = false
                historyButton.isEnabled = true
                historyButton.alpha = 1
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButtons()
        homeButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonAction(_:)), for: .touchDown)
    }
    
    func homeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func historyButtonAction() {
        if let historyViewController = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            present(historyViewController, animated: true, completion: nil)
        }
    }
    
    func startButtonAction(_ sender: UIButton) {
        playing = !playing
        mixButtons()
    }
    
}

extension PlayViewController {
    func makeButtons() {
        let buttonSize = Double(containerView.frame.width / sqrt(25))
        var buttonX = 0.0
        var buttonY = 0.0
        for i in 1...25 {
            let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonSize, height: buttonSize))
            button.tag = i
            button.setTitle("\(i)", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            button.layer.borderWidth = 4
            button.layer.borderColor = UIColor.white.cgColor
            
            containerView.addSubview(button)
            buttons.append(button)
            
            buttonX += buttonSize
            if buttonX >= Double(containerView.frame.width) {
                buttonX = 0.0
                buttonY += buttonSize
            }
        }
    }
    
    func mixButtons() {
        var randomNumbers = [Int]()

        for i in 1...buttons.count {
            randomNumbers.insert(i, at: Int(arc4random_uniform(UInt32(i))))
        }
        
        for button in buttons {
            button.tag = randomNumbers.removeFirst()
            button.setTitle("\(button.tag)", for: .normal)
        }
    }
    
}












