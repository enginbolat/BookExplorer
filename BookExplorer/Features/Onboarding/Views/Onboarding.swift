//
//  Onboarding.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    private var viewModel: OnboardingViewModel {
        OnboardingViewModel(coordinator: coordinator)
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.Padding.md) {
            Spacer()
            Image(systemName: "person.3")
            Text("Welcome to Book Explorer")
                .font(AppTypography.Heading.h2)
                .tint(.black)
            
            Text("Discover a world of books at your fingertips. Search, explore and learn with our easy-to-use app")
                .font(AppTypography.Caption.regular)
                .tint(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 280)
            
            Spacer()
            CustomButton(title: "Start Exploring", onPress: { 
                coordinator.presentSheet(.OnboardingPrivacySheet)
            })
        } .padding(AppSpacing.Padding.xl)
    }
}


#Preview {
    Onboarding()
        .environmentObject(AppCoordinator())
}
