//
//  MovementDetailCardModel.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import SwiftUI

/// Model used to populate a `MovementDetailCardView`
public struct MovementDetailCardModel: Identifiable {
    /// Movement id
    public let id: UUID

    /// System image name (using SF Icons)
    public let systemImageName: String

    /// Tint color
    public let imageTintColor: Color

    /// Movement title
    public let title: String

    /// Movement description
    public let description: String

    /// Movement amount
    public let amount: String

    /// Multi-payment info
    public let paymentInfo: Payments?

    /// Default initializer
    /// - Parameters:
    ///   - id: movement id
    ///   - systemImageName: system image name (using SF symbols)
    ///   - imageTintColor: image tint color
    ///   - title: movement title
    ///   - description: movement description
    ///   - amount: movement amount
    ///   - paymentInfo: multi-payment info
    public init(id: UUID,
                systemImageName: String,
                imageTintColor: Color,
                title: String,
                description: String,
                amount: String,
                paymentInfo: Payments? = nil)
    {
        self.id = id
        self.systemImageName = systemImageName
        self.imageTintColor = imageTintColor
        self.title = title
        self.description = description
        self.amount = amount
        self.paymentInfo = paymentInfo
    }

    /// Model used to reflect a multi-payment movement
    public struct Payments {
        /// Current payment
        public let current: Int

        /// Total payments
        public let total: Int

        /// Multi-payment title
        public let title: String

        /**
         Computed multi-payment string

         Multi-payment string

         -  Note:
         Uses the format "Title: 2/3"
         */
        public var paymentString: String {
            return "\(self.title) \(self.current)/\(self.total)"
        }

        /// Default initializer
        /// - Parameters:
        ///   - current: current payment
        ///   - total: total payments
        ///   - title: multi-payment title
        public init(current: Int,
                    total: Int,
                    title: String)
        {
            self.current = current
            self.total = total
            self.title = title
        }
    }
}
