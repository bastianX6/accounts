//
//  View+AnyView.swift
//
//
//  Created by Bastián Véliz Vega on 15-09-20.
//

import SwiftUI

public extension View {
    /// Wraps this view with a type eraser.
    /// - Returns: An `AnyView` wrapping this view.
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
