//
//  NewMovementViewModelSpyTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import Combine
import Foundation
import Previews
import TestUtils
import XCTest

@testable import NewMovement

class NewMovementViewModelSpyTests: XCTestCase {
    var sut: NewMovementViewModelSpy!
    var mockDataSource: MovementPreviewSpy!
    var incomeData: MovementResources!
    var expenditureData: MovementResources!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockDataSource = MovementPreviewSpy()
        incomeData = DataFake.incomeData
        expenditureData = DataFake.expenditureData
        sut = NewMovementViewModelSpy(dataSource: mockDataSource,
                                      incomeData: incomeData,
                                      expenditureData:
                                      expenditureData,
                                      onEnd: {})
    }

    // MARK: - Save movement

    func testSaveMovementSuccess() {
        let expect = expectation(description: "wait for a successfull save call")
        sut.expect = expect
        sut.expectedState = .end
        sut.setState(.saving)
        wait(for: [expect], timeout: 1.0)
        XCTAssertTrue(mockDataSource.saveCalled)
        XCTAssertTrue(sut.state is NewMovementEndState)
    }

    func testSaveMovementFail() {
        let expect = expectation(description: "wait for a failed save call")
        mockDataSource.saveSuccess = false
        sut.expect = expect
        sut.expectedState = .error(error: nil)
        sut.setState(.saving)
        wait(for: [expect], timeout: 1.0)
        XCTAssertTrue(mockDataSource.saveCalled)
        XCTAssertTrue(sut.state is NewMovementErrorState)
    }

    func testDeleteMovementSuccess() {
        let expect = expectation(description: "wait for a successfull delete call")
        sut.expect = expect
        sut.expectedState = .end
        sut.setState(.deleting)
        wait(for: [expect], timeout: 1.0)
        XCTAssertTrue(mockDataSource.deleteCalled)
        XCTAssertTrue(sut.state is NewMovementEndState)
    }

    func testDeleteMovementFail() {
        let expect = expectation(description: "wait for a failed delete call")
        mockDataSource.deleteSuccess = false
        sut.expect = expect
        sut.expectedState = .error(error: nil)
        sut.setState(.deleting)
        wait(for: [expect], timeout: 1.0)
        XCTAssertTrue(mockDataSource.deleteCalled)
        XCTAssertTrue(sut.state is NewMovementErrorState)
    }
}
