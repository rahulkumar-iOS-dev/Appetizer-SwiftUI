//
//  OrderView.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { order in
                            AppetizerListCell(appetizer: order)
                        }
                        .onDelete(perform: { indexSet in
                            order.delete(indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
                    Button(action: {
                        print("Place Order")
                    }, label: {
                        let totalPrice = String(format: "%.2f", order.totalPrice)
                        Text("$\(totalPrice) - Place Order")
                            .fontWeight(.semibold)
                    })
                    .modifier(StandardButtonStyle())
                    //.padding(.bottom, 24)
                }
                
                if order.items.isEmpty {
                    EmptyOrderView(image: .emptyOrder, message: "You have no items in your orders, please add an appetizer.")
                }
                
            }
            .background(Color(UIColor.systemGray6))
            .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
