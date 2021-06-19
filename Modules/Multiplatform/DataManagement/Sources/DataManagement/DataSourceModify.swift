//
//  DataSourceModify.swift
//
//
//  Created by Bastián Véliz Vega on 11-09-20.
//

import Combine
import Foundation

/// Protocol that contains contracts to modify movements
public protocol DataSourceModify {
    /// Save a new movement
    /// - Parameter movement: the movement to be saved
    func save(movement: Movement) -> AnyPublisher<Void, Error>

    /// Delete a movement
    /// - Parameter movement: An existing movement
    func delete(movement: Movement) -> AnyPublisher<Void, Error>

    /// Update a movement
    /// - Parameter movement: A movement containing the new data
    func update(movement: Movement) -> AnyPublisher<Void, Error>
}
