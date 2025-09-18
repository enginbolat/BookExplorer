//
//  ProfileView.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    private func rightIconOnPress() {
        coordinator.push(page: .Settings)
    }
    
    var body: some View {
        VStack {
            Header(title: "Profile", leftIconVisible: false, rightIcon: "gearshape", rightIconOnPress: rightIconOnPress)
            ScrollView {
                VStack {
                    Circle()
                        .frame(width: 180)
                    Text("Ethen Harper")
                        .font(AppTypography.Heading.h3)
                    Text("@ethen_harper")
                        .font(AppTypography.Caption.regular)
                        .tint(.gray)
                        .padding(.bottom, AppSpacing.Padding.md)
                    
                    InputView(
                        icon: "envelope",
                        title: "Email",
                        value: "ethen.harper@gmail.com",
                        rightIcon: "chevron.right"
                    )
                    
                    InputView(
                        icon: "envelope",
                        title: "Password",
                        value: "********",
                        rightIcon: "chevron.right"
                    )
                    
                    InputView(
                        icon: "bookmark",
                        title: "Favorites",
                        rightIcon: "chevron.right",
                        rightIconText: "12"
                    )
                    Spacer()
                }
                .padding(AppSpacing.Padding.xl)
            }
        }
    }
}

#Preview {
    ProfileView()
}
