//
//  Image+MacOS.swift
//
//
//  Created by Bastián Véliz Vega on 16-09-20.
//

import SwiftUI

public extension Image {
    /// Get a resizable image using SF symbols
    /// - Parameter systemName: system image name
    /// - Returns: An `Image` instance
    static func resizableImage(systemName: String) -> some View {
        return Image(systemName: systemName)
            .resizable()
            .eraseToAnyView()
    }
}
