//
//  Order.swift
//  Appetizers
//
//  Created by Rahul Kumar on 01/01/24.
//

import Foundation

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
 
    var totalPrice: Double {
        items.reduce(0, {$0 + $1.price} )
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func delete(_ appetizerOffset : IndexSet) {
        items.remove(atOffsets: appetizerOffset)
    }
}
