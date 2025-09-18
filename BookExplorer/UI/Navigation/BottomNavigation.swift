//
//  BottomNavigation.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct BottomNavigation: View {
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Home", systemImage: "house") }
            SearchView().tabItem { Label("Search", systemImage: "magnifyingglass") }
            FavoritesView().tabItem { Label("Saved", systemImage: "bookmark") }
            ProfileView().tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    BottomNavigation()
}
