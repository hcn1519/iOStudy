//
//  Record.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 13..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import Foundation

class Record: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.scoreTime, forKey: "scoreTime")
        aCoder.encode(self.date, forKey: "date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decodeName = aDecoder.decodeObject(forKey: "name") as? String,
            let decodeDate = aDecoder.decodeObject(forKey: "date") as? Date else { return nil }
        self.name = decodeName
        self.date = decodeDate
        self.scoreTime = aDecoder.decodeDouble(forKey: "scoreTime")
    }

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
