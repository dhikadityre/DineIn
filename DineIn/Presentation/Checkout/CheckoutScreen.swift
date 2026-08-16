//
//  CheckoutScreen.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct CheckoutScreen: View {
    @EnvironmentObject var order: Order
    
    let paymentMethods = ["Cash", "Credit Card", "Debit", "Points"]
    @State var paymentMethod: String = "Cash"
    
    @State var isUseLoyaltyCard: Bool = false
    @State var loyaltyCardId: String = ""
    
    let tipAmountsPercentage: [Int] = [5, 10, 15, 20, 25, 30, 35]
    @State var tipAmountPercentage: Int = 5
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmountPercentage)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View { render() }
    
    private func render() -> some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentMethod) {
                    ForEach(paymentMethods, id: \.self) {
                        Text($0)
                    }
                }
                Toggle(isOn: $isUseLoyaltyCard.animation()) {
                    Text("Add loyalty card ID")
                }
                if isUseLoyaltyCard {
                    TextField("Enter your loyalty card ID", text: $loyaltyCardId)
                }
            }
            
            Section("Add a tip") {
                Picker("Percentage", selection: $tipAmountPercentage) {
                    ForEach(tipAmountsPercentage, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutScreen()
        .environmentObject(Order())
}
