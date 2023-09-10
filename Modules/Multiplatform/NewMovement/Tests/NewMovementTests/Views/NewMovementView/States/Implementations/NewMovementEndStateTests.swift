//
//  NewMovementEndStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import XCTest

@testable import NewMovement

class NewMovementEndStateTests: XCTestCase {
    var sut: NewMovementEndState!

    func testDefaultInit() {
        sut = NewMovementEndState()

        XCTAssertFalse(sut.isIncome)
        XCTAssertFalse(sut.showLoading)
        XCTAssertFalse(sut.isEdition)
        XCTAssertFalse(sut.showDeleteAlert)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitIncome() {
        sut = NewMovementEndState()
        sut.isIncome = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.newIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitOnEditIncome() {
        sut = NewMovementEndState()
        sut.isIncome = true
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitExpenditure() {
        sut = NewMovementEndState()
        sut.isIncome = false
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitOnEditExpenditure() {
        sut = NewMovementEndState()
        sut.isIncome = false
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testOnEndCall() {
        var onEndCalled = false
        let expect = expectation(description: "wait for onEnd call")
        sut = NewMovementEndState()
        sut.onEnd = {
            onEndCalled = true
            expect.fulfill()
        }

        sut.endAction()
        wait(for: [expect], timeout: 1.0)
        XCTAssertTrue(onEndCalled)
    }
}
