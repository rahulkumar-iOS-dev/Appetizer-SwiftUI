//
//  Button.swift
//  Appetizers
//
//  Created by Rahul Kumar on 30/12/23.
//

import SwiftUI

struct APButton: View {
    let title: String
    let size: CGSize
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Text", size: CGSize(width: 260, height: 50))
}
