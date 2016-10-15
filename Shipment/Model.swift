//
//  Model.swift
//  Shipment
//
//  Created by Atakishiyev Orazdurdy on 10/15/16.
//  Copyright © 2016 Veriloft. All rights reserved.
//

import Foundation

typealias SelectType = (title: String, option: String)

let opt0 = "opt0"
let opt1 = "opt1"

func loadStoreType(key: String) -> StoredType? {
    if let unarchivedObject = UserDefaults.standard.object(forKey: key) as? Data {
        if let value = NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? StoredType {
            return value
        }
    }
    return nil
}

func saveType(value: StoredType, key: String) {
    let archivedObject = NSKeyedArchiver.archivedData(withRootObject: value)
    let defaults = UserDefaults.standard
    defaults.set(archivedObject, forKey: key)
    defaults.synchronize()
}

class StoredType: NSObject, NSCoding {
    
    var tableRow: Int = 0
    var collectionRow: Int = 0
    
    class var sharedStore : StoredType {
        struct Singleton {
            // lazily initiated, thread-safe from "let"
            static let instance = StoredType()
        }
        return Singleton.instance
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(tableRow, forKey: "tableRow")
        aCoder.encode(collectionRow, forKey: "collectionRow")
    }
    
    override init() {
        
    }
    
    required init(tableRow:Int, collectionRow:Int) {
        self.tableRow = tableRow
        self.collectionRow = collectionRow
        super.init()
    }
    //MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        tableRow = aDecoder.decodeInteger(forKey: "tableRow")
        collectionRow = aDecoder.decodeInteger(forKey: "collectionRow")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(tableRow, forKey: "tableRow")
        aCoder.encode(collectionRow, forKey: "collectionRow")
    }
}
