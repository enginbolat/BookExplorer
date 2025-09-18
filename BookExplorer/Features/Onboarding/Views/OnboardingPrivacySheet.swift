//
//  OnboardingPrivacySheet.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct OnboardingPrivacySheet: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    private func buttonOnPress() {
        coordinator.dismissSheet()
        coordinator.replace(page: .OnboardingSwipeableFirst)
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.Padding.md) {
            Spacer()
            Image(systemName: "person.3")
            Text("Your Privacy Matters")
                .font(AppTypography.Heading.h2)
                .tint(.black)
            Text("Book Explorer respects your privacy. We only ask for permissions that enhance your experience, and you're always in control.")
                .font(AppTypography.Caption.regular)
                .tint(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 280)
            Spacer()
            CustomButton(title: "Accept", onPress: buttonOnPress)
            CustomButton(title: "Maybe Later", theme: .Secondary, onPress: buttonOnPress)
        }.padding(AppSpacing.Padding.xl)
    }
}
