//
//  ReadMovementsQuery.swift
//
//
//  Created by Bastián Véliz Vega on 11-09-20.
//

import Foundation

/// Structs that contains query elements
public struct ReadMovementsQuery {
    /// Starting date
    public let fromDate: Date

    /// Ending date
    public let toDate: Date

    /// Store id. Used to filter by store
    public let storeId: UUID?

    /// Category id. Used to filter by category
    public let categoryId: UUID?

    /// Payment id. Used to filter multi-payment movements
    public let paymentId: UUID?

    /// Default initializer
    /// - Parameters:
    ///   - fromDate: starting date
    ///   - toDate: ending date
    ///   - storeId: store id. Default value: `nil`
    ///   - categoryId: category id. Default value: `nil`
    ///   - paymentId: payment id. Default value: `nil`
    public init(fromDate: Date,
                toDate: Date,
                storeId: UUID? = nil,
                categoryId: UUID? = nil,
                paymentId: UUID? = nil) {
        self.fromDate = fromDate
        self.toDate = toDate
        self.storeId = storeId
        self.categoryId = categoryId
        self.paymentId = paymentId
    }
}
