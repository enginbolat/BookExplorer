//
//  SettingsRowView.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct SettingsRow: View {
    var title: String
    var subtitle: String?
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: AppSpacing.Padding.xs) {
                Text(title)
                    .font(AppTypography.Heading.section)
                    .foregroundColor(.black)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(AppTypography.Caption.regular)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding(AppSpacing.Padding.md)
        .background(Color.white.opacity(0.8))
        .overlay(
            RoundedRectangle(cornerRadius: AppSpacing.Padding.sm)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}
