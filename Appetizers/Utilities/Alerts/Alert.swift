//
//  Alert.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    internal init(title: String, message: String, dismissButtonText: String) {
        self.title = Text(title)
        self.message = Text(message)
        self.dismissButton = .default(Text(dismissButtonText))
    }
}

struct AlertContext {
    
    //MARK: ----- Network error -----
    static let invalidData = AlertItem(title: "Server Error",
                                       message: "The data received from the server was invalid. Please contact support.",
                                       dismissButtonText: "OK")
    
    static let invalidResponse = AlertItem(title: "Server Error",
                                           message: "Invalid response from the server. Please try again later or contact support.",
                                           dismissButtonText: "OK")
    
    static let invalidURL = AlertItem(title: "Server Error",
                                      message: "There was an issue connecting to the server. If this persists, please contact support.",
                                      dismissButtonText: "OK")
    
    static let unableToComplete = AlertItem(title: "Server Error",
                                            message: "Unable to complete your request at this time. Please check your internet connection.",
                                            dismissButtonText: "OK")
    
    //MARK: ----- Profile form error -----
    
    static let firstNameIsEmpty = AlertItem(title: "First Name",
                                            message: "Please fill first name",
                                            dismissButtonText: "OK")
    
    static let lastNameIsEmpty = AlertItem(title: "Last Name",
                                            message: "Please fill last name",
                                            dismissButtonText: "OK")
    
    static let emailIsEmpty = AlertItem(title: "Email",
                                            message: "Please fill email",
                                            dismissButtonText: "OK")
    
    static let invalidEmail = AlertItem(title: "Invalid Email",
                                            message: "Please fill valid email",
                                            dismissButtonText: "OK")
    
    static let profileSaved = AlertItem(title: "Profile Saved",
                                            message: "Profile saved successfully",
                                            dismissButtonText: "OK")
    
    static let profileFetchSaveError = AlertItem(title: "Profile Save Error",
                                            message: "Getting error during saving or fetching profile data",
                                            dismissButtonText: "OK")
}
