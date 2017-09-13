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
        resetButton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
    }
    
    func closeButtonAction() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func resetButtonAction() {
        let alertController = UIAlertController.resetAlert()
        UIAlertAction.cancelButton(target: alertController, title: "NO", style: .destructive)
        UIAlertAction.okButton(target: alertController, title: "YES") { (_) in
            RecordList.shared.recordList.removeAll()
            self.tableView.reloadData()
        }
        present(alertController, animated: true, completion: nil)
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecordList.shared.recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        let score = RecordList.shared.recordList[indexPath.row]
        cell.textLabel?.text = score.scoreTime.convertTimeToString()
        cell.detailTextLabel?.text = "\(score.name) \(score.date.convertKoreanDate())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RecordList.shared.recordList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
