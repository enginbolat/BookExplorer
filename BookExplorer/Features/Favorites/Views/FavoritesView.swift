//
//  SearchView.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            Header(title: "Favorites")
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<15) { _ in
                        BookCard(title: "Title", description: "Desc", onPress: {
                            coordinator.push(page: .Detail(id: "12"))
                        })
                    }
                }
                .padding(.horizontal, AppSpacing.Padding.lg)
                .padding(.top, AppSpacing.Padding.md)
            }
        }
    }
}

#Preview {
    FavoritesView()
}
