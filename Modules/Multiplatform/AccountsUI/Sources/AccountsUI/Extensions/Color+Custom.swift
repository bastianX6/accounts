//
//  Color+Custom.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import Foundation

#if !os(macOS)
    import UIKit
#else
    import AppKit
#endif
import SwiftUI

public extension Color {
    /**
     Background color

     Get the background color for each OS
     */
    static let backgroundColor: Color = {
        #if os(iOS)
            return Color(UIColor.systemBackground)
        #elseif os(tvOS)
            let color = UIColor.dynamicColor(light: .white, dark: .black)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.black)
        #else
            let color = NSColor.dynamicColor(light: .white, dark: .black)
            return Color(color)
        #endif
    }()

    /**
     Foreground color

     Get the foreground color for each OS
     */
    static let foregroundColor: Color = {
        #if os(tvOS) || os(iOS)
            let color = UIColor.dynamicColor(light: .black, dark: .white)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.white)
        #else
            let color = NSColor.dynamicColor(light: .black, dark: .white)
            return Color(color)
        #endif
    }()

    /**
     Indigo color

     Indigo color for each OS
     */
    static let indigo: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemIndigo)
        #elseif os(watchOS)
            return Color(UIColor.tintsSystemIndigoDark)
        #else
            return Color(NSColor.systemIndigo)
        #endif
    }()

    /**
     Teal color

     Indigo color for each OS
     */
    static let teal: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemTeal)
        #elseif os(watchOS)
            return Color(UIColor.tintsSystemTealDark)
        #else
            return Color(NSColor.systemTeal)
        #endif
    }()

    /**
     System gray color

     System gray color for each OS

     */
    static let systemGray: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemGray)
        #elseif os(watchOS)
            return Color(UIColor.gray)
        #else
            return Color(NSColor.systemGray)
        #endif
    }()

    /**
     System gray 2 color

     System gray 2 color for each OS
     */
    static let systemGray2: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray2)
        #elseif os(tvOS)
            let color = UIColor.dynamicColor(light: .greySystemGrey2Light, dark: .greySystemGrey2Dark)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.greySystemGrey2Dark)
        #else
            let color = NSColor.dynamicColor(light: .greySystemGrey2Light, dark: .greySystemGrey2Dark)
            return Color(color)
        #endif
    }()

    /**
     System gray 3 color

     System gray 3 color for each OS
     */
    static let systemGray3: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray3)
        #elseif os(tvOS)
            let color = UIColor.dynamicColor(light: .greySystemGrey3Light, dark: .greySystemGrey3Dark)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.greySystemGrey3Dark)
        #else
            let color = NSColor.dynamicColor(light: .greySystemGrey3Light, dark: .greySystemGrey3Dark)
            return Color(color)
        #endif
    }()

    /**
     System gray 4 color

     System gray 4 color for each OS
     */
    static let systemGray4: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray4)
        #elseif os(tvOS)
            let color = UIColor.dynamicColor(light: .greySystemGrey4Light, dark: .greySystemGrey4Dark)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.greySystemGrey4Dark)
        #else
            let color = NSColor.dynamicColor(light: .greySystemGrey4Light, dark: .greySystemGrey4Dark)
            return Color(color)
        #endif
    }()

    /**
     System gray 5 color

     System gray 5 color for each OS
     */
    static let systemGray5: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray5)
        #elseif os(tvOS)
            let color = UIColor.dynamicColor(light: .greySystemGrey5Light, dark: .greySystemGrey5Dark)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.greySystemGrey5Dark)
        #else
            let color = NSColor.dynamicColor(light: .greySystemGrey5Light, dark: .greySystemGrey5Dark)
            return Color(color)
        #endif
    }()

    /**
     System gray 6 color

     System gray 6 color for each OS
     */
    static let systemGray6: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray6)
        #elseif os(tvOS)
            let color = UIColor.dynamicColor(light: .greySystemGrey6Light, dark: .greySystemGrey6Dark)
            return Color(color)
        #elseif os(watchOS)
            return Color(UIColor.greySystemGrey6Dark)
        #else
            let color = NSColor.dynamicColor(light: .greySystemGrey6Light, dark: .greySystemGrey6Dark)
            return Color(color)
        #endif
    }()
}
