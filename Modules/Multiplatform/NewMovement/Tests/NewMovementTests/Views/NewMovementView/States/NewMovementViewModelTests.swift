//
//  NewMovementViewModelTests.swift
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

class NewMovementViewModelTests: XCTestCase {
    var sut: NewMovementViewModel!
    var mockDataSource: MovementPreviewSpy!
    var incomeData: MovementResources!
    var expenditureData: MovementResources!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockDataSource = MovementPreviewSpy()
        incomeData = DataFake.incomeData
        expenditureData = DataFake.expenditureData
        sut = NewMovementViewModel(dataSource: mockDataSource,
                                   incomeData: incomeData,
                                   expenditureData:
                                   expenditureData,
                                   onEnd: {})
    }

    // MARK: - Values

    func testDefaultInit() {
        XCTAssertFalse(sut.isIncome)
        XCTAssertFalse(sut.isEdition)
        XCTAssertTrue(sut.state is NewMovementViewBaseState)
        XCTAssertFalse(sut.state.isIncome)
        XCTAssertEqual(sut.stores, expenditureData.stores)
        XCTAssertEqual(sut.categories, expenditureData.categories)
    }

    func testIsIncome() {
        sut.isIncome = true
        XCTAssertTrue(sut.isIncome)
        XCTAssertTrue(sut.state is NewMovementViewBaseState)
        XCTAssertEqual(sut.stores, incomeData.stores)
        XCTAssertEqual(sut.categories, incomeData.categories)
        XCTAssertTrue(sut.state.isIncome)
    }

    // MARK: - States

    func testEditionStateChange() {
        sut.isEdition = true
        XCTAssertTrue(sut.state.isEdition)
    }

    func testSetSavingState() {
        sut.setState(.saving)
        XCTAssertTrue(sut.state is NewMovementSavingState)
    }

    func testSetErrorState() {
        sut.setState(.error(error: nil))
        XCTAssertTrue(sut.state is NewMovementErrorState)
    }

    func testSetEndState() {
        sut.setState(.end)
        XCTAssertTrue(sut.state is NewMovementEndState)
    }

    func testSetaAkingForDeleteState() {
        sut.setState(.askingForDelete)
        XCTAssertTrue(sut.state is NewMovementAskingForDeleteState)
    }

    func testDeletingState() {
        sut.setState(.deleting)
        XCTAssertTrue(sut.state is NewMovementDeletingState)
    }
}
