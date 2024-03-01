//
//  Appetizer.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import Foundation

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// MARK: - Request
struct Appetizer: Decodable, Identifiable {
    let id, calories: Int
    let name, description: String
    let protein: Int
    let imageURL: String
    let price: Double
    let carbs: Int
}

struct AppetizerMockData {
    static let sampleAppetizer = Appetizer(id: 1, calories: 99, name: "Test appetizer", description: "Test appetizer description for sample to test it", protein: 99, imageURL: "https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r", price: 9, carbs: 99)
    
    static let orderOne = Appetizer(id: 1, calories: 99, name: "Test appetizer One", description: "Test appetizer description for sample to test it", protein: 99, imageURL: "https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r", price: 9, carbs: 99)
    
    static let orderTwo = Appetizer(id: 2, calories: 99, name: "Test appetizer Two", description: "Test appetizer description for sample to test it", protein: 99, imageURL: "https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r", price: 9, carbs: 99)
    

    static let orderThree = Appetizer(id: 3, calories: 99, name: "Test appetizer Three", description: "Test appetizer description for sample to test it", protein: 99, imageURL: "https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r", price: 9, carbs: 99)
    
    static let orderItems = [orderOne, orderTwo, orderThree]
    
    
    static let Appetizers = [Appetizer].init(repeating: sampleAppetizer, count: 10)
}
