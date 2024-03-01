//
//  XmarkCircle.swift
//  Appetizers
//
//  Created by Rahul Kumar on 30/12/23.
//

import SwiftUI

struct XmarkCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color(.systemBackground))
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .tint(.black)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    XmarkCircle()
}
