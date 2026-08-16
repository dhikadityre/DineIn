//
//  DineInTabBar.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct DineInTabBar: View {
    var body: some View { render() }
    
    private func render() -> some View {
        renderTabBar()
    }
}

extension DineInTabBar {
    private func renderTabBar() -> some View {
        TabView {
            MenuScreen()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
            OrderScreen()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    DineInTabBar()
        .environmentObject(Order())
}
