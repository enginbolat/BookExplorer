//
//  SettingsView.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    private var viewModel: SettingsViewModel {
        SettingsViewModel(coordinator: coordinator)
    }
    
    @State private var notificationToggle = false
    @State private var dataSaverToggle = false
    @State private var privacyToggle = false
    @State private var manageAccountToggle = false
    @State private var logoutToggle = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("General")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, AppSpacing.Padding.md)
            
            SettingsRow(
                title: "App Notifications",
                subtitle: "New releases & recommendations.",
                isOn: $notificationToggle
            )
            Divider()
            
            SettingsRow(
                title: "Data Saver Mode",
                subtitle: "Reduces data usage.",
                isOn: $dataSaverToggle
            )
            
            
            Text("PRIVACT & ACCOUNT")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, AppSpacing.Padding.md)
            
            SettingsRow(
                title: "Privacy Settings",
                isOn: $privacyToggle
            )
            Divider()
            SettingsRow(
                title: "Manage Account",
                isOn: $manageAccountToggle
            )
            Divider()
            SettingsButtonRowView(
                title: "Logout",
                action: {
                    viewModel.removeOnboardSheetStorage()
                }
            )
            Spacer()
        }.padding(AppSpacing.Padding.xl)
    }
}

#Preview {
    SettingsView()
}
