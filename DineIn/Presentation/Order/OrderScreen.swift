//
//  OrderScreen.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct OrderScreen: View {
    @EnvironmentObject var order: Order
    
    var body: some View { render() }
    
    private func render() -> some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { menuItem in
                        renderOrderedItem(menuItem)
                    }
                    .onDelete(perform: didDeleteItem(at:))
                }
                Section {
                    NavigationLink("Place Order") {
                        CheckoutScreen()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func didDeleteItem(at offset: IndexSet) {
        order.items.remove(atOffsets: offset)
    }
}

extension OrderScreen {
    private func renderOrderedItem(_ menuItem: MenuItem) -> some View {
        HStack {
            Text(menuItem.name)
                .font(.headline)
            Spacer()
            Text("$\(menuItem.price)")
        }
    }
}

#Preview {
    OrderScreen()
        .environmentObject(Order())
}
