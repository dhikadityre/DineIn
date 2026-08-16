//
//  DineInApp.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

@main
struct DineInApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            DineInTabBar()
                .environmentObject(order)
        }
    }
}
