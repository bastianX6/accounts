//
//  MovementPreviewSpy.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import DataManagement
import Previews

public class MovementPreviewSpy: MovementPreview {
    public var saveCalled = false
    public var deleteCalled = false
    public var updateCalled = false

    override public func save(movement: Movement) -> AnyPublisher<Void, Error> {
        self.saveCalled = true
        return super.save(movement: movement)
    }

    override public func delete(movement: Movement) -> AnyPublisher<Void, Error> {
        self.deleteCalled = true
        return super.delete(movement: movement)
    }

    override public func update(movement: Movement) -> AnyPublisher<Void, Error> {
        self.updateCalled = true
        return super.update(movement: movement)
    }
}
