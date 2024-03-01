//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Rahul Kumar on 30/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        VStack {
            WebImage(url: URL(string: appetizer.imageURL))
                .resizable()
                .placeholder(Image(.foodPlaceholder))
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .fontWeight(.semibold)
                .font(.title2)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            Spacer()
            
            HStack(spacing: 40) {
                NutritionInfoView(title: "Calories", value: appetizer.calories)
                NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                NutritionInfoView(title: "Protein", value: appetizer.protein)
            }
            
            Spacer()
            
            Button(action: {
                order.add(appetizer)
                isShowingDetailView = false
            }, label: {
                let price = String(format: "%.2f", appetizer.price)
                Text("$\(price) - Add to Order")
            })
            .modifier(StandardButtonStyle())
        }
        .frame(width: 300,
               height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetailView = false
        }, label: {
            XmarkCircle()
        }), alignment: .topTrailing)
    }
}

struct NutritionInfoView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .fontWeight(.semibold)
                .font(.caption)
            
            Text("\(value)")
                .bold()
                .fontWeight(.semibold)
                .font(.caption)
                .foregroundStyle(Color.secondary)
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: AppetizerMockData.sampleAppetizer, isShowingDetailView: .constant(false))
}
