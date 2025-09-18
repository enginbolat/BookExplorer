//
//  OnboardingSwipeableFirst.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct OnboardingSwipeableFirst: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    private var viewModel: OnboardingViewModel {
        OnboardingViewModel(coordinator: coordinator)
    }
    @State private var currentIndex: Int = 0
    
    private func updateIndexValue(type: UpdateIndexEnum) {
        if type == .Decrease && currentIndex > 0 {
            currentIndex -= 1
            return
        }
        
        if currentIndex < 2 { currentIndex += 1 }
        else {
            viewModel.handleSeenOnboarding()
        }
    }
    
    
    var body: some View {
        VStack {
            Image(ImageEnum.OnboardImage.value)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
            
            Text("Welcome to Book Explorer")
                .font(AppTypography.Heading.h2)
                .tint(.black)
            
            Text("Discover a world of books at your fingertips. Search, explore and learn with our easy-to-use app")
                .font(AppTypography.Caption.regular)
                .tint(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 280)
            
            Spacer()
            
            PageIndicator(numberOfPages: 3, currentIndex: currentIndex)
                .padding(.bottom, AppSpacing.Padding.md)
            
            HStack {
                CustomButton(title: "Skip", theme: .Secondary, onPress: { viewModel.handleSeenOnboarding() })
                CustomButton(title: "Next", onPress: { updateIndexValue(type: .Add) })
            }
            
        }.padding(AppSpacing.Padding.xl)
    }
}

struct PageIndicator: View {
    var numberOfPages: Int
    var currentIndex: Int
    
    var body: some View {
        HStack(spacing: AppSpacing.Padding.sm) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                if index == currentIndex {
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: 20, height: 8)
                        .animation(.easeInOut, value: currentIndex)
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

#Preview {
    OnboardingSwipeableFirst()
}
