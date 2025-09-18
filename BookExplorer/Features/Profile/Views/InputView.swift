//
//  InputView.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct InputView : View {
    var icon: String
    var title: String
    var value: String?
    var rightIcon: String?
    var rightIconText: String?
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: AppSpacing.Padding.md)
            .fill(.white)
            .overlay { content }
            .overlay { border }
            .frame(height: 70)
    }

    var content: some View {
        HStack(spacing: AppSpacing.Padding.xxl) {
            RoundedRectangle(cornerRadius: 99)
                .fill(.blue.opacity(0.4))
                .frame(width: 48, height: 48)
                .overlay {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .padding(AppSpacing.Padding.md)
                }
            
            VStack(alignment: .leading) {
                Text(title)
                if let value = value {
                    Text(value)
                        .tint(.gray)
                        .font(AppTypography.Caption.secondary)
                }
            }
            
            Spacer()
            if let rightIconText = rightIconText { Text(rightIconText) }
            if let rightIcon = rightIcon { Image(systemName: rightIcon) }
        }.padding(.horizontal, AppSpacing.Padding.xl)
    }
    
    var border: some View {
        RoundedRectangle(cornerRadius: AppSpacing.Padding.md)
            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
    }
}


#Preview {
    InputView(icon: "envelope", title: "Email", value: "ethen.harper@gmail.com",rightIcon: "chevron.right", rightIconText: "12")
        .padding(AppSpacing.Padding.xl)
}
