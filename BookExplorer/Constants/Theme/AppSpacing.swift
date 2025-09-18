//
//  AppSpacing.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

/**
 * AppSpacing - Centralized spacing system for consistent UI design
 * 
 * This struct provides a comprehensive set of spacing values and convenience methods
 * to maintain consistent padding, margins, and spacing throughout the app.
 * 
 * Usage Guidelines:
 * - Use Padding for internal spacing within components
 * - Use Margin for external spacing between components
 * - Use Component for specific UI element spacing
 * - Always prefer these values over hardcoded numbers
 */
struct AppSpacing {
    
    // MARK: - Padding Values
    /**
     * Padding - Internal spacing within UI components
     * 
     * Use these values for padding inside views, cards, buttons, and other components.
     * These values create consistent internal spacing throughout the app.
     */
    struct Padding {
        /// Extra small padding (4pt) - Use for: minimal spacing, icon padding, tight layouts
        static let xs: CGFloat = 4
        
        /// Small padding (8pt) - Use for: vertical spacing between items, bottom spacing in sections
        static let sm: CGFloat = 8
        
        /// Medium padding (12pt) - Use for: search bars, input fields, card internal spacing
        static let md: CGFloat = 12
        
        /// Large padding (16pt) - Use for: horizontal padding, grid spacing, list item spacing
        static let lg: CGFloat = 16
        
        /// Extra large padding (20pt) - Use for: main content padding, screen edges, section padding
        static let xl: CGFloat = 20
        
        /// Extra extra large padding (24pt) - Use for: major section separation, large content blocks
        static let xxl: CGFloat = 24
        
        /// Extra extra extra large padding (32pt) - Use for: section spacing, major layout separation
        static let xxxl: CGFloat = 32
        
        /// Extra extra extra extra large padding (40pt) - Use for: maximum spacing, hero sections
        static let xxxxl: CGFloat = 40
    }
    
    // MARK: - Margin Values
    /**
     * Margin - External spacing between UI components
     * 
     * Use these values for spacing between different components or sections.
     * These values create consistent external spacing throughout the app.
     */
    struct Margin {
        /// Extra small margin (4pt) - Use for: minimal component separation
        static let xs: CGFloat = 4
        
        /// Small margin (8pt) - Use for: close component spacing
        static let sm: CGFloat = 8
        
        /// Medium margin (12pt) - Use for: standard component spacing
        static let md: CGFloat = 12
        
        /// Large margin (16pt) - Use for: comfortable component spacing
        static let lg: CGFloat = 16
        
        /// Extra large margin (20pt) - Use for: generous component spacing
        static let xl: CGFloat = 20
        
        /// Extra extra large margin (24pt) - Use for: major component separation
        static let xxl: CGFloat = 24
        
        /// Extra extra extra large margin (32pt) - Use for: section separation
        static let xxxl: CGFloat = 32
        
        /// Extra extra extra extra large margin (40pt) - Use for: maximum component separation
        static let xxxxl: CGFloat = 40
    }
    
    // MARK: - Component Spacing
    /**
     * Component - Specific spacing values for common UI patterns
     * 
     * Use these predefined values for common spacing patterns to ensure consistency
     * across similar UI elements throughout the app.
     */
    struct Component {
        /// Card spacing (12pt) - Use for: spacing between card elements, card internal padding
        static let cardSpacing: CGFloat = 12
        
        /// Section spacing (32pt) - Use for: spacing between major sections, page sections
        static let sectionSpacing: CGFloat = 32
        
        /// Item spacing (16pt) - Use for: spacing between list items, grid items
        static let itemSpacing: CGFloat = 16
        
        /// Grid spacing (16pt) - Use for: spacing in grid layouts, collection views
        static let gridSpacing: CGFloat = 16
        
        /// Vertical spacing (8pt) - Use for: vertical spacing between items in lists
        static let verticalSpacing: CGFloat = 8
        
        /// Bottom spacing (12pt) - Use for: bottom spacing in sections, form elements
        static let bottomSpacing: CGFloat = 12
    }
    
    // MARK: - Convenience Methods
    /**
     * Convenience Methods - Helper methods for common padding patterns
     * 
     * Use these methods to quickly apply common padding patterns without
     * manually creating EdgeInsets objects.
     */
    
    /// Creates horizontal padding (left and right only)
    /// - Parameter value: The padding value to apply horizontally
    /// - Returns: EdgeInsets with horizontal padding only
    static func horizontal(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: 0, leading: value, bottom: 0, trailing: value)
    }
    
    /// Creates vertical padding (top and bottom only)
    /// - Parameter value: The padding value to apply vertically
    /// - Returns: EdgeInsets with vertical padding only
    static func vertical(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: 0, bottom: value, trailing: 0)
    }
    
    /// Creates uniform padding on all sides
    /// - Parameter value: The padding value to apply on all sides
    /// - Returns: EdgeInsets with uniform padding
    static func all(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: value, bottom: value, trailing: value)
    }
    
    // MARK: - Common Padding Combinations
    /**
     * Common Padding Combinations - Predefined padding patterns for common use cases
     * 
     * Use these methods for consistent padding patterns across similar UI elements.
     * These combinations follow the app's design system and ensure consistency.
     */
    
    /// Standard screen padding (20pt horizontal) - Use for: main content areas, screen edges
    /// - Returns: EdgeInsets with standard horizontal screen padding
    static func screenPadding() -> EdgeInsets {
        EdgeInsets(top: 0, leading: Padding.xl, bottom: 0, trailing: Padding.xl)
    }
    
    /// Standard content padding (20pt horizontal) - Use for: content containers, text blocks
    /// - Returns: EdgeInsets with standard horizontal content padding
    static func contentPadding() -> EdgeInsets {
        EdgeInsets(top: 0, leading: Padding.xl, bottom: 0, trailing: Padding.xl)
    }
    
    /// Standard card padding (12pt all sides) - Use for: cards, containers, input fields
    /// - Returns: EdgeInsets with standard card padding
    static func cardPadding() -> EdgeInsets {
        EdgeInsets(top: Padding.md, leading: Padding.md, bottom: Padding.md, trailing: Padding.md)
    }
}

// MARK: - Usage Examples
/**
 * Usage Examples:
 * 
 * // Basic padding usage
 * .padding(AppSpacing.Padding.lg)           // 16pt padding on all sides
 * .padding(.horizontal, AppSpacing.Padding.xl) // 20pt horizontal padding
 * .padding(.vertical, AppSpacing.Padding.sm)   // 8pt vertical padding
 * 
 * // Convenience methods
 * .padding(AppSpacing.screenPadding())        // Standard screen padding
 * .padding(AppSpacing.cardPadding())          // Standard card padding
 * .padding(AppSpacing.horizontal(AppSpacing.Padding.lg)) // 16pt horizontal only
 * 
 * // Component spacing
 * VStack(spacing: AppSpacing.Component.cardSpacing)     // 12pt spacing
 * LazyVGrid(columns: columns, spacing: AppSpacing.Component.gridSpacing) // 16pt grid spacing
 * 
 * // Margin usage
 * .padding(.bottom, AppSpacing.Margin.lg)     // 16pt bottom margin
 */
