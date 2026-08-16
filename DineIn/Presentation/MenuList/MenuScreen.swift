//
//  MenuScreen.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct MenuScreen: View {
    let viewModel: MenuScreenViewModel
    
    var body: some View { render() }
    
    private func render() -> some View {
        NavigationStack {
            List {
                ForEach(viewModel.menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemMenu(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                DetailMenu(item: item)
            })
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    MenuScreen(viewModel: MenuScreenViewModel())
}
