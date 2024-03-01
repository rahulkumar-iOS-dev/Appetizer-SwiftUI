//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import SwiftUI
 
final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isAPILoading = false
    @Published var isShowingDetailView = false
    var selectedAppetizer: Appetizer?
    
    
    func getAppetizers() {
        isAPILoading = true
        NetworkManager.shared.getRequest(path: .getAppetizers) { [weak self] (result: Result<AppetizerResponse, APError>) in
            guard let self else { return }
            DispatchQueue.main.async {
                self.isAPILoading = false
                switch result {
                case .success(let appetizerResponse):
                    self.appetizers = appetizerResponse.request
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
}
