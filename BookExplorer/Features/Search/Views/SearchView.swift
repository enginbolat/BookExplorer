//
//  SearchView.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var query = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: "Search", rightIconVisible: false)
            
            SearchBar(text: $query)
                        .padding(AppSpacing.Padding.md)
                    
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<45, id: \.self) { index in
                        BookCarHorizontal(onPress: {
                            coordinator.push(page: .Detail(id: "12"))
                        })
                            .padding(.vertical, AppSpacing.Padding.sm)
                        if index != 44 { Divider() }
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}


