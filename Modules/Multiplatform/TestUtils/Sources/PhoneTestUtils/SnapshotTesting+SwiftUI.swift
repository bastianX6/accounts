//
//  SnapshotTesting+SwiftUI.swift
//
//
//  Created by Bastián Véliz Vega on 19-12-20.
//

#if canImport(UIKit)
import SnapshotTesting
import SwiftUI
import UIKit

public extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    static func image(drawHierarchyInKeyWindow: Bool = false,
                      precision: Float = 1,
                      size: CGSize? = nil,
                      traits: UITraitCollection = .init()) -> Snapshotting
    {
        Snapshotting<UIViewController, UIImage>.image(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            size: size,
            traits: traits
        )
        .pullback(UIHostingController.init(rootView:))
    }
}

public extension View {
    func frameFromSize(_ size: CGSize) -> some View {
        frame(width: size.width, height: size.height)
    }
}
#endif
