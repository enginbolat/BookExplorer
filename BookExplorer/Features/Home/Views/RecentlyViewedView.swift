//
//  RecentlyViewedView.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct RecentlyViewedView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var recentlyViewedBooks: [RandomBook]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: AppSpacing.Component.itemSpacing) {
                ForEach(recentlyViewedBooks, id: \.self) { item in
                    BookCard(title: item.title,
                             description: "",
                             imageUrl: item.coverURL,
                             onPress: {coordinator.push(page: .Detail(id: item.key ?? "12"))}
                    )
                }
            }.padding(.horizontal, AppSpacing.Padding.lg)
        }.frame(maxHeight: 230)
    }
}
