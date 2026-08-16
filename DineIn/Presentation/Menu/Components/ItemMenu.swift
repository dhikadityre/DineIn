//
//  ItemMenu.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct ItemMenu: View {
    let item: MenuItem
    
    var body: some View { render() }
    
    private func render() -> some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

extension ItemMenu {
    
}

#Preview {
    ItemMenu(item: MenuItem.example)
}
