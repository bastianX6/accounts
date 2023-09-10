//
//  NewMovementViewModelSpy.swift
//
//
//  Created by Bastián Véliz Vega on 09-09-23.
//

import Foundation
import XCTest

@testable import NewMovement

class NewMovementViewModelSpy: NewMovementViewModel {
    var expectedState: NewMovementViewStateEnum = .end
    var expect: XCTestExpectation?

    override func setState(_ state: NewMovementViewStateEnum) {
        super.setState(state)

        if expectedState.representation == state.representation {
            expect?.fulfill()
        }
    }
}
