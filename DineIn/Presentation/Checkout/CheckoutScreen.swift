//
//  CheckoutScreen.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct CheckoutScreen: View {
    @EnvironmentObject var order: Order
    @State private(set) var viewModel: CheckoutScreenViewModel
    
    var body: some View { render() }
    
    private func render() -> some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $viewModel.paymentMethod) {
                    ForEach(viewModel.paymentMethods, id: \.self) {
                        Text($0)
                    }
                }
                Toggle(isOn: $viewModel.isUseLoyaltyCard.animation()) {
                    Text("Add loyalty card ID")
                }
                if viewModel.isUseLoyaltyCard {
                    TextField("Enter your loyalty card ID", text: $viewModel.loyaltyCardId)
                }
            }
            
            Section("Add a tip") {
                Picker("Percentage", selection: $viewModel.tipAmountPercentage) {
                    ForEach(viewModel.tipAmountsPercentage, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
            Section("Total: \(viewModel.calculateTotalPrice(total: Double(order.total)))") {
                Button("Confirm Order") {
                    viewModel.isSuccessfullConfirmOrder.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(
            "Order Confirmed",
            isPresented: $viewModel.isSuccessfullConfirmOrder,
        ) {
            
        } message: {
            Text("Your total was \(viewModel.calculateTotalPrice(total: Double(order.total))) - Thank you")
        }
    }
}

#Preview {
    CheckoutScreen(viewModel: CheckoutScreenViewModel())
        .environmentObject(Order())
}
