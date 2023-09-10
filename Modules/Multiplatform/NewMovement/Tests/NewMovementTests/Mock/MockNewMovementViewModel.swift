//
//  MockNewMovementViewModel.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import XCTest

@testable import NewMovement

class MockNewMovementViewModel: NewMovementViewModel {
    var expect: XCTestExpectation?
    var currentStateEnum: NewMovementViewStateEnum = .askingForDelete

    override func setState(_ state: NewMovementViewStateEnum) {
        self.currentStateEnum = state
        super.setState(state)
        expect?.fulfill()
    }
}
