//
//  NewMovementAskingForDeleteStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import XCTest

@testable import NewMovement

class NewMovementAskingForDeleteStateTests: XCTestCase {
    var sut: NewMovementAskingForDeleteState!

    func testDefaultInit() {
        sut = NewMovementAskingForDeleteState()

        XCTAssertFalse(sut.isIncome)
        XCTAssertFalse(sut.showLoading)
        XCTAssertFalse(sut.isEdition)
        XCTAssertTrue(sut.showDeleteAlert)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitIncome() {
        sut = NewMovementAskingForDeleteState()
        sut.isIncome = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.newIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitOnEditIncome() {
        sut = NewMovementAskingForDeleteState()
        sut.isIncome = true
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitExpenditure() {
        sut = NewMovementAskingForDeleteState()
        sut.isIncome = false
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitOnEditExpenditure() {
        sut = NewMovementAskingForDeleteState()
        sut.isIncome = false
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }
}
