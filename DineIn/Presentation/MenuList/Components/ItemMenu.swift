//
//  ItemMenu.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct ItemMenu: View {
    let item: MenuItem
    let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
    
    var body: some View { render() }
    
    private func render() -> some View {
        HStack {
            renderThumbnail()
            renderContent()
            Spacer()
            renderRestriction()
        }
    }
}

extension ItemMenu {
    private func renderThumbnail() -> some View {
        Image(item.thumbnailImage)
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 2))
    }
    
    private func renderContent() -> some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
            Text("$\(item.price)")
        }
    }
    
    private func renderRestriction() -> some View {
        ForEach(item.restrictions, id: \.self) { restriction in
            Text(restriction)
                .font(.caption)
                .fontWeight(.black)
                .padding(5)
                .background(colors[restriction, default: .black])
                .clipShape(Circle())
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ItemMenu(item: MenuItem.example)
}
