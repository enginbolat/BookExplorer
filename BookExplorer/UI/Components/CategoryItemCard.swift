//
//  CategoryItemCard.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct CategoryItemCard: View {
    var title: String
    var image: String
    var onPress: (()-> Void)?
    
    var body: some View {
        RoundedRectangle(cornerRadius: AppSpacing.Padding.md)
            .fill(Color.white.opacity(0.7))
            .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
            .onTapGesture {
                onPress?()
            }
            .overlay(
                HStack(spacing: AppSpacing.Component.cardSpacing) {
                    Image(image)
                        .resizable()
                        .scaledToFill()              
                        .frame(width: 60, height: 60)
                        .clipped()                   
                        .cornerRadius(8)
                    
                    Text(title)
                        .font(AppTypography.Body.medium)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .truncationMode(.tail)
                    
                    Spacer()
                }
                .padding(.horizontal, AppSpacing.Padding.md)
            )
            .overlay(
                RoundedRectangle(cornerRadius: AppSpacing.Padding.md)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
}

#Preview {
    VStack(spacing: AppSpacing.Component.cardSpacing) {
        CategoryItemCard(title: "Fantasy",image: "")
        CategoryItemCard(title: "Longer Text Example",image: "")
    }
    .padding(AppSpacing.Padding.lg)
}
