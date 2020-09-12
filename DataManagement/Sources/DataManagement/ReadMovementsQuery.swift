//
//  ReadMovementsQuery.swift
//
//
//  Created by Bastián Véliz Vega on 11-09-20.
//

import Foundation

/// Structs that contains query elements
public struct ReadMovementsQuery {
    let fromDate: Date
    let toDate: Date

    let storeId: UUID?
    let categoryId: UUID?
    let paymentId: UUID?

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
