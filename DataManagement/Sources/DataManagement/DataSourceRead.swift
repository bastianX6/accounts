//
//  DataSourceRead.swift
//
//
//  Created by Bastián Véliz Vega on 11-09-20.
//

import Combine
import Foundation

/// Protocol that contains contracts to read movements
public protocol DataSourceRead {
    /// Reads several movements
    /// - Parameter query: query parameters
    func readMovements(query: ReadMovementsQuery) -> AnyPublisher<[Movement], Error>

    /// Reads a single movement
    /// - Parameter id: the movement id
    func readMovement(id: UUID) -> AnyPublisher<Movement, Error>
}
