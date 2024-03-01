//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: appetizer.imageURL))
                .resizable()
                .placeholder(Image(.foodPlaceholder))
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(Color.secondary)
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.leading)
            Spacer()
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: AppetizerMockData.sampleAppetizer)
}
