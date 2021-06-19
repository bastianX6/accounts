//
//  MovementSimpleCardModel.swift
//
//
//  Created by Bastián Véliz Vega on 15-09-20.
//

import SwiftUI

/// Model used to populate a `MovementSimpleCardView`
public struct MovementSimpleCardModel: Identifiable {
    /// Movement id
    public let id: UUID

    /// System image name (using SF Icons)
    public let systemImageName: String

    /// Tint color
    public let imageTintColor: Color

    /// Movement name
    public let name: String

    /// Movement amount
    public let amount: String

    /// Default initializer
    /// - Parameters:
    ///   - id: movement id
    ///   - name: movement name
    ///   - amount: movement amount
    ///   - systemImageName: system image name (using SF symbols)
    ///   - imageTintColor: image tint color
    public init(id: UUID,
                name: String,
                amount: String,
                systemImageName: String,
                imageTintColor: Color) {
        self.id = id
        self.name = name
        self.amount = amount
        self.systemImageName = systemImageName
        self.imageTintColor = imageTintColor
    }
}
