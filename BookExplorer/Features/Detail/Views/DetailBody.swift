//
//  DetailBody.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct DetailBody: View {
    var detail: Detail
    
    var body: some View {
        VStack(spacing: AppSpacing.Padding.xxl) {
            ScrollView {
                heroImage(detail.coverUrl)
                
                VStack(alignment: .leading) {
                    // MARK: Top Info
                    VStack(alignment: .leading) {
                        Text(detail.title ?? "")
                        Text("by F. Scott Fitzgerald")
                        Divider()
                        
                        Text("Published")
                        Text(detail.formattedPublishDate)
                    }.padding(.horizontal, AppSpacing.Padding.xl)
                    
                    // MARK: Subject
                    Text("Subject")
                        .font(AppTypography.Heading.h3)
                        .padding(.bottom, AppSpacing.Padding.sm)
                        .padding(.horizontal, AppSpacing.Padding.xl)
                    scrollableSubject(detail.subjects ?? [])
                    
                    // MARK: BOTTOM Info
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(AppTypography.Heading.h3)
                            .padding(.bottom, AppSpacing.Padding.sm)
                        
                        Text(detail.description?.text ?? "")
                        Spacer()
                    }.padding(.horizontal, AppSpacing.Padding.xl)
                    
                    Spacer()
                }
            }
            // MARK: Confirm
            CustomButton(title: "Add Favorites", onPress: {})
                .padding(.horizontal, AppSpacing.Padding.xl)
        }
    }
}

// MARK: Hero Image
@ViewBuilder
private func heroImage(_ url: URL?) -> some View {
    VStack {
        if let url = url {
            AsyncImage(url: url)
                .aspectRatio(contentMode: .fit)
        } else {
            Rectangle().fill(Color.gray.opacity(0.3))
        }
    }
    .frame(height: 300)
    .frame(maxWidth: .infinity)
}

// MARK: Scrollable Subject
@ViewBuilder
func scrollableSubject(_ subjects: [String]) -> some View {
    ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: AppSpacing.Padding.sm) {
            ForEach(subjects, id: \.self) { subject in
                Text(subject)
                    .padding(.horizontal, AppSpacing.Padding.md)
                    .padding(.vertical, AppSpacing.Padding.xs + 2)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(AppSpacing.Padding.sm)
            }
        }
        .padding(.horizontal, AppSpacing.Padding.xl)
    }.frame(height: 20)
}
