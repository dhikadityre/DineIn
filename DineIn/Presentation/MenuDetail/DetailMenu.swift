//
//  DetailMenu.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import SwiftUI

struct DetailMenu: View {
    let item: MenuItem
    var body: some View { render() }
    
    private func render() -> some View {
        VStack {
            renderPhotoWithCredit()
            renderDescription()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension DetailMenu {
    private func renderPhotoWithCredit() -> some View {
        ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            
            Text(item.photoCredit)
                .font(.caption)
                .padding(8)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                        .fill(Color.black)
                )
                .foregroundStyle(Color.white)
                .offset(x: -5, y: -5)
        }
    }
    
    private func renderDescription() -> some View {
        Text(item.description)
            .padding()
    }
}

#Preview {
    NavigationStack {
        DetailMenu(item: MenuItem.example)
    }
}
