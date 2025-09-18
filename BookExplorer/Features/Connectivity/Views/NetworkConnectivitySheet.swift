//
//  NetworkConnectivitySheet.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct NetworkConnectivitySheet: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @Injected(NetworkConnectivityServiceProtocol.self) private var connectivityService
    
    @State private var isConnected: Bool = true
    
    var body: some View {
        VStack(spacing: AppSpacing.Padding.xl) {
            // Icon
            Image(systemName: isConnected ? "wifi" : "wifi.slash")
                .font(.system(size: 60))
                .foregroundColor(isConnected ? .green : .red)
            
            // Title
            Text(isConnected ? "Connected" : "No Internet Connection")
                .font(AppTypography.Heading.h2)
                .multilineTextAlignment(.center)
            
            // Description
            Text(isConnected ? 
                 "You're back online! All features are now available." :
                 "Please check your internet connection and try again.")
                .font(AppTypography.Caption.regular)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.Padding.xl)
            
            Spacer()
            
            // Action Button
            CustomButton(
                title: isConnected ? "Continue" : "Retry",
                theme: isConnected ? .Primary : .Secondary,
                onPress: {
                    if isConnected {
                        coordinator.dismissSheet()
                    } else {
                        // Retry logic - check connectivity again
                        isConnected = connectivityService.isConnected
                    }
                }
            )
        }
        .padding(AppSpacing.Padding.xl)
        .onReceive(connectivityService.connectivityStatus) { connected in
            withAnimation(.easeInOut(duration: 0.3)) {
                isConnected = connected
            }
        }
    }
}

#Preview {
    NetworkConnectivitySheet()
        .environmentObject(AppCoordinator())
}