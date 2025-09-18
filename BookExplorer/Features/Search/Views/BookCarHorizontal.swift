//
//  BookCarHorizontal.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct BookCarHorizontal: View {
    var imageUrl: URL?
    var onPress:(()->Void)?
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let imageUrl = imageUrl {
                AsyncImage(url: imageUrl)
                    .frame(width: 80, height: 120)
                    .cornerRadius(12)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 120)
                    .cornerRadius(12)
            }

            
            VStack(alignment: .leading, spacing: 8) {
                Text("The Secret Of Garden")
                    .font(AppTypography.Heading.section)
                    .lineLimit(1)
                
                Text("Frances Hodgson Burnett")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Text("1911")
                    .font(AppTypography.Caption.regular)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .onTapGesture { onPress?() }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, AppSpacing.Padding.lg)
    }
}

#Preview {
    BookCarHorizontal()
}
