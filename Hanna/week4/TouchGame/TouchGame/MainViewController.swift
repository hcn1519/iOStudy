//
//  ViewController.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 11..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
    }
    
    func playButtonAction() {
        if let playViewController = storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as? PlayViewController {
            navigationController?.pushViewController(playViewController, animated: true)
        }
    }
    
    func historyButtonAction() {
        if let historyViewController = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            navigationController?.pushViewController(historyViewController, animated: true)
        }
    }
}

