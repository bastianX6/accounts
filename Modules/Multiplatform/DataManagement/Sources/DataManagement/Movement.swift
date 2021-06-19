//
//  Movement.swift
//
//
//  Created by Bastián Véliz Vega on 11-09-20.
//

import Foundation

/// Protocol that defines the basic structure for a movement
public protocol Movement {
    /// Movement id
    var id: UUID { get }

    /// Movement name
    var name: String { get }

    /// Movement description
    var description: String { get }

    /// Movement amount
    var amount: Float { get }

    /// Movement date
    var date: Date { get }

    /// Describes if movement is paid or is not
    var isPaid: Bool { get }

    /// Describes if movement is permanent
    var isPermanent: Bool { get }

    /// Store Id. Should be used to clasify movements by store
    var storeId: UUID { get }

    /// Category Id. Should be used to clasify movements by category
    var categoryId: UUID { get }

    /// Payment Id. Is used to have a reference to a multi-payment buy
    var paymentId: UUID? { get }
}
