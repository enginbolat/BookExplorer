//
//  CustomButton.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

enum ButtonTheme {
    case Primary, Secondary
    
    var backgroundColor: Color {
        switch self {
        case .Primary:
            return .blue
        case .Secondary:
            return .gray.opacity(0.5)
        }
    }
        
    var textColor: Color {
        switch self {
        case .Primary:
            return .white
        case .Secondary:
            return .black
        }
    }
}

struct CustomButton: View {
    var title: String
    var theme: ButtonTheme? = .Primary
    var onPress: () -> Void
    var disabled: Bool?
    
    var body: some View {
        Button(action: onPress) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, AppSpacing.Padding.md)
                .padding(.vertical, AppSpacing.Padding.sm)
                .tint(theme?.textColor)
        }
        .buttonStyle(.borderedProminent)
        .tint(theme?.backgroundColor)
        .disabled(disabled ?? false)
    }
}

#Preview {
    CustomButton(title: "Custom Button",theme: .Secondary ,onPress: {} , disabled: false)
        .padding(AppSpacing.Padding.lg)
}
