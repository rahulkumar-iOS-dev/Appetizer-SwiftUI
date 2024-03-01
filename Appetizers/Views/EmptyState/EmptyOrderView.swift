//
//  EmptyOrderView.swift
//  Appetizers
//
//  Created by Rahul Kumar on 01/01/24.
//

import SwiftUI

struct EmptyOrderView: View {
    
    let image: ImageResource
    let message: String
    var body: some View {
    
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
        
    }
}

#Preview {
    EmptyOrderView(image: .emptyOrder, message: "You have no items in your orders, please add an appetizer.")
}
