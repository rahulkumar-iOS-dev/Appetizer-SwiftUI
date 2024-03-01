//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetailView)
                .navigationTitle("Appetizers")
                
            }
            .blur(radius: viewModel.isShowingDetailView ? 15 : 0)
            .onAppear {
                if viewModel.appetizers.isEmpty {
                    viewModel.getAppetizers()
                }
            }
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.25)))
            }
            
            if viewModel.isAPILoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                    .scaleEffect(CGSize(width: 2.0, height: 2.0))
                
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
