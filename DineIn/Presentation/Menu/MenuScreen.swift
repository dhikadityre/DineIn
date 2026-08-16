//
//  MenuScreen.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct MenuScreen: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View { render() }
    
    private func render() -> some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            ItemMenu(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    MenuScreen()
}
