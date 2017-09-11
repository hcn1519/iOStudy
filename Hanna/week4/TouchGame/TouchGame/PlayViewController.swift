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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
    }
    
    func homeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func historyButtonAction() {
        if let historyViewController = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            present(historyViewController, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
