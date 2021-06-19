//
//  AppAppearance.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import SwiftUI

/// Protocol to defines UI properties
public protocol Appearance {
    /// Application background color
    var backgroundColor: Color { get }

    /// Application accent color
    var accentColor: Color { get }
}

/// Default aplication appearance
public class AppAppearance: ObservableObject, Appearance {
    /// Shared appearance
    public static let shared = AppAppearance()

    private init() {}

    /// Application background color
    public let backgroundColor: Color = .systemGray6

    /// Application accent color
    public let accentColor: Color = .indigo
}
