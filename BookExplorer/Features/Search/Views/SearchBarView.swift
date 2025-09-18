//
//  SearchBarView.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search books...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(AppSpacing.Padding.md)
        .background(Color(.systemGray6))
        .cornerRadius(AppSpacing.Padding.lg)
    }
}

#Preview {
    SearchBar(text: .constant("Search Value"))
        .padding(.horizontal, AppSpacing.Padding.xl)
}


