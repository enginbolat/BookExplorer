//
//  Header.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct Header: View {
    var title: String
    var leftIconVisible: Bool = false
    var rightIcon: String? = "magnifyingglass"
    var rightIconOnPress: (() -> Void)?
    var rightIconVisible: Bool? = true
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    if leftIconVisible { Circle() }
                }.frame(width: 12, height: 12)
                
                Spacer()
                Text(title)
                    .font(AppTypography.Heading.section)
                
                Spacer()
                    
                
                if rightIconVisible ?? true {
                    VStack {
                        Image(systemName: rightIcon ?? "magnifyingglass")
                            .onTapGesture {
                                if let rightIconOnPress = rightIconOnPress {
                                    rightIconOnPress()
                                }
                            }
                    }
                    .frame(width: 12, height: 12)
                }
            }.padding(.horizontal, AppSpacing.Padding.lg)
            
            Divider()
        }
    }
}

#Preview {
    Header(title: "Book Explorer")
}
