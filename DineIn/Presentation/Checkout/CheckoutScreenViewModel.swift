//
//  CheckoutScreenViewModel.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import Observation
import Foundation

@Observable
public class CheckoutScreenViewModel {
    /// Payment Method
    let paymentMethods = ["Cash", "Credit Card", "Debit", "Points"]
    var paymentMethod: String = "Cash"
    
    /// Loyalty
    var isUseLoyaltyCard: Bool = false
    var loyaltyCardId: String = ""
    
    /// Percentage Tip Amount
    let tipAmountsPercentage: [Int] = [5, 10, 15, 20, 25, 30, 35]
    var tipAmountPercentage: Int = 5
    
    
    /// Total Price
    var totalPrice: String = 0.formatted(.currency(code: "USD"))
    
    /// Success Alert
    var isSuccessfullConfirmOrder: Bool = false
}

extension CheckoutScreenViewModel {
    public func calculateTotalPrice(
        total: Double
//        tip: Double
    ) -> String {
        let tipValue = total / 100 * Double(tipAmountPercentage)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
}
