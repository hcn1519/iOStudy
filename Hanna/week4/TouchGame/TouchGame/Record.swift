//
//  Record.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 13..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import Foundation

class Record {
    private(set) var name: String
    private(set) var scoreTime: Double
    private(set) var date: Date
    
    init(name: String?, scoreTime: Double) {
        self.name = name ?? "anonymous"
        self.scoreTime = scoreTime
        self.date = Date()
    }
}

extension Record {
    static var recordList = [Record]() {
        didSet {
            recordList.sort { $0.scoreTime < $1.scoreTime }
        }
    }
}
