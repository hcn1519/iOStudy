//
//  HistoryViewController.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 11..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    func closeButtonAction() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Record.recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        let score = Record.recordList[indexPath.row]
        cell.textLabel?.text = score.scoreTime.convertTimeToString()
        cell.detailTextLabel?.text = "\(score.name) \(score.date.convertKoreanDate())"
        return cell
    }
    
}
