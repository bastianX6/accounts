//
//  MovementsSum.swift
//
//
//  Created by Bastián Véliz Vega on 22-09-20.
//

import Foundation

/// Protocol used to represent the sum of movements grouped by category or store
public protocol MovementsSum {
    /// Store or Category id
    var id: UUID { get }

    /// Sum of movements for the given category or store
    var sum: Float { get }
}
