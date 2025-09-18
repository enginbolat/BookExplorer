//
//  SettingsButtonRowView.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct SettingsButtonRowView: View {
    var title: String
    var subtitle: String? = nil
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: AppSpacing.Padding.xs) {
                    Text(title)
                        .font(AppTypography.Heading.section)
                        .foregroundColor(.red) // Logout genelde kırmızı olur
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(AppTypography.Caption.regular)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(AppSpacing.Padding.md)
            .background(Color.white.opacity(0.8))
            .overlay(
                RoundedRectangle(cornerRadius: AppSpacing.Padding.sm)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
}

