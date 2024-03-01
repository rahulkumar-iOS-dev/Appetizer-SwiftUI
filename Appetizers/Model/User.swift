//
//  User.swift
//  Appetizers
//
//  Created by Rahul Kumar on 01/01/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkin = false
    var frequentRefill = false
}
