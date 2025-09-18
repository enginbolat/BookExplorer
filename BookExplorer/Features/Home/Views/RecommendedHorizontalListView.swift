//
//  RecommendedHorizontalList.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct RecommendedHorizontalListView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var recommendedBookData: [RandomBook]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: AppSpacing.Component.itemSpacing) {
                ForEach(recommendedBookData, id: \.self) { item in
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
