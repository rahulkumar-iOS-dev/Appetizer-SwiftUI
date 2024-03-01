//
//  Modifier.swift
//  Appetizers
//
//  Created by Rahul Kumar on 08/01/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .controlSize(.regular)
        .tint(.brandPrimary)
        .padding(.bottom, 30)
    }
}
