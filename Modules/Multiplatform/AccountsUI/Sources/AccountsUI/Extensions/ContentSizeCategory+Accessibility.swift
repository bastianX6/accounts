//
//  ContentSizeCategory+Accessibility.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import SwiftUI

public extension ContentSizeCategory {
    /**
     Check if an Accessibility category is used

     - Note:
        - Returns `false` is ContentSizeCategory value is` .extraSmall`, `.small`, `.medium`, `.large`, `.extraLarge`, `.extraExtraLarge`, `.extraExtraExtraLarge`
        - Return `true` in another case
     */
    var isAccessibility: Bool {
        switch self {
        case .extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge:
            return false
        default:
            return true
        }
    }

    /**
     Check if an extra large Accessibility category is used

     - Note:
        - Returns `true` is ContentSizeCategory value is, `.extraLarge`, `.extraExtraLarge`, `.extraExtraExtraLarge`
        - Return `false` in another case
     */
    var isExtraLarge: Bool {
        switch self {
        case .extraLarge, .extraExtraLarge, .extraExtraExtraLarge:
            return true
        default:
            return false
        }
    }
}
