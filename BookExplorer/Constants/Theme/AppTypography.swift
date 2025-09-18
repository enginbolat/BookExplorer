//
//  AppTypography.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct AppTypography {
    struct Heading {
        static let h1 = Font.largeTitle.weight(.bold)     // Ana başlık
        static let h2 = Font.title.weight(.semibold)      // Orta başlık
        static let h3 = Font.title2.weight(.semibold)     // Alt başlık
        static let section = Font.headline  
    }
    
    struct Body {
        static let regular = Font.body                    // Normal text
        static let medium = Font.body.weight(.medium)     // Biraz öne çıkan
        static let secondary = Font.subheadline           // İkincil text
    }
    
    struct Caption {
        static let regular = Font.caption                 // Küçük detay
        static let secondary = Font.caption2              // Daha küçük detay
    }
}
