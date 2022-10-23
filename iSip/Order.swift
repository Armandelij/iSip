//
//  Order.swift
//  iSip
//
//  Created by Elijah Armande on 10/21/22.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [Coffee]()
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) {$0 + $1.price}
        } else {
            return 0
        }
    }
    
    func add(item: Coffee) {
        items.append(item)
    }
    
    func remove(item: Coffee) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
}
