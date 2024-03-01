//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Rahul Kumar on 30/12/23.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
 
    @AppStorage(AppStorageKey.user) var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    private var isValidForm: Bool {
        guard !user.firstName.isEmpty else {
            alertItem = AlertContext.firstNameIsEmpty
            return false
        }
        
        guard !user.lastName.isEmpty else {
            alertItem = AlertContext.lastNameIsEmpty
            return false
        }
        
        guard !user.email.isEmpty else {
            alertItem = AlertContext.emailIsEmpty
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func performSaveChanges() {
        guard isValidForm else {
            return 
        }
        saveUserInAppStorage()
    }
    
    private func saveUserInAppStorage() {
        do {
            let data = try JSONEncoder().encode(user)
            alertItem = AlertContext.profileSaved
            userData = data
        } catch {
            alertItem = AlertContext.profileFetchSaveError
        }
    }
    
    func fetchUserData() {
        guard let userData else { return }
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            alertItem = AlertContext.profileFetchSaveError
        }
    }
}
