//
//  SnapshotTesting+SwiftUI.swift
//  
//
//  Created by Bastián Véliz Vega on 26-06-21.
//

#if canImport(AppKit)
import AppKit
import Foundation
import SnapshotTesting
import SwiftUI

public extension Snapshotting where Value: SwiftUI.View, Format == NSImage {
    static func image(precision: Float,
                      perceptualPrecision: Float,
                      size: CGSize) -> Snapshotting
    {
        Snapshotting<NSViewController, NSImage>.image(
            precision: precision,
            perceptualPrecision: perceptualPrecision,
            size: size
        )
        .pullback(NSHostingController.init(rootView:))
    }
}
#endif
