//
//  PurchaseStore.swift
//  ShortcutDemo
//
//  Created by Neil Smyth on 7/29/22.
//

import Foundation
import SwiftUI

struct PurchaseStore {
    
    @AppStorage("demostorage", store: UserDefaults(
                    suiteName: "group.com.ebookfrenzy.shortcutdemo"))
    var store: Data = Data()
    
    var purchases: [Purchase] = []
    
    init() {
        purchases = getPurchases()
    }
    
    func getPurchases() -> [Purchase] {
        
        var latest: [Purchase] = []
        let decoder = JSONDecoder()
        
        if let history = try? decoder.decode(PurchaseData.self, from: store) {
            latest = history.purchases
        }
        return latest
    }
    
    func update(purchaseData: PurchaseData) -> Bool {
    
        var result = true
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(purchaseData) {
            store = data
        } else {
            result = false
        }
        return result
    }
}
