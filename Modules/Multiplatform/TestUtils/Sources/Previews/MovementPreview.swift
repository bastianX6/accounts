//
//  MovementPreview.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Combine
import DataManagement
import Foundation

open class MovementPreview: DataSourceRead, DataSourceModify {
    open var isEmpty: Bool
    open var movements: [Movement] = []

    open var saveSuccess = true
    open var deleteSuccess = true
    open var updateSuccess = true

    public init(isEmpty: Bool = false) {
        self.isEmpty = isEmpty
    }

    // MARK: - DataSourceRead

    open func readMovements(query _: ReadMovementsQuery) -> AnyPublisher<[Movement], Error> {
        let future = Future<[Movement], Error> { promise in
            promise(.success(DataFake.movements))
        }
        return future.eraseToAnyPublisher()
    }

    open func readMovement(id _: UUID) -> AnyPublisher<Movement, Error> {
        return Fail<Movement, Error>(error: MovementPreviewError.other).eraseToAnyPublisher()
    }

    open func getMovementSumByCategory(query _: ReadMovementsQuery) -> AnyPublisher<[MovementsSum], Error> {
        let future = Future<[MovementsSum], Error> { promise in
            promise(.success([]))
        }
        return future.eraseToAnyPublisher()
    }

    open func getMovementSumByStore(query _: ReadMovementsQuery) -> AnyPublisher<[MovementsSum], Error> {
        let future = Future<[MovementsSum], Error> { [unowned self] promise in
            promise(.success(self.isEmpty ? [] : DataFake.movementSumArray))
        }
        return future.eraseToAnyPublisher()
    }

    // MARK: - DataSourceModify

    open func save(movement: Movement) -> AnyPublisher<Void, Error> {
        let future = Future<Void, Error> { [unowned self] promise in
            if self.saveSuccess {
                self.movements.append(movement)
                promise(.success(()))
            } else {
                return promise(.failure(MovementPreviewError.other))
            }
        }
        return future.eraseToAnyPublisher()
    }

    open func delete(movement: Movement) -> AnyPublisher<Void, Error> {
        let future = Future<Void, Error> { [unowned self] promise in
            if self.deleteSuccess {
                self.movements.removeAll(where: { $0.id == movement.id })
                promise(.success(()))
            } else {
                return promise(.failure(MovementPreviewError.other))
            }
        }
        return future.eraseToAnyPublisher()
    }

    open func update(movement: Movement) -> AnyPublisher<Void, Error> {
        let future = Future<Void, Error> { [unowned self] promise in
            if self.updateSuccess {
                self.movements.removeAll(where: { $0.id == movement.id })
                self.movements.append(movement)
                promise(.success(()))
            } else {
                promise(.failure(MovementPreviewError.other))
            }
        }
        return future.eraseToAnyPublisher()
    }
}

enum MovementPreviewError: Error {
    case other
}
