//
//  View+Modifiers.swift
//
//
//  Created by Bastián Véliz Vega on 02-10-20.
//

import SwiftUI

public extension View {
    /// Update navigation bar color
    /// - Parameters:
    ///   - backgroundColor: navigation bar backgroud color
    ///   - titleColor: navigation bar tittle color
    /// - Returns: A view with navigation bar and title colors appliedI
    func navigationBarColor(_ backgroundColor: Color,
                            titleColor: Color = Color.foregroundColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

    /// Add a background color view ignoring all safe area edges
    /// - Parameter color: background color
    /// - Returns: A ZStack with the view and the background color ignoring safe area edges
    func fullBackgroundColor(_ color: Color) -> some View {
        self.modifier(FullBackgroundModifier(color: color))
    }

    /// Wraps the content in a NavigationView in iOS. In other OS it returns the same view
    /// - Returns: A view wrapped in a Navigation view, or the same view
    func wrapInNavigationViewIfNeeded() -> some View {
        self.modifier(WrapInNavigationViewModifier())
    }
}
