//
//  NewMovementViewBaseStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import XCTest

@testable import NewMovement

class NewMovementViewBaseStateTests: XCTestCase {
    var sut: NewMovementViewBaseState!

    func testDefaultInit() {
        sut = NewMovementViewBaseState()

        XCTAssertFalse(sut.isIncome)
        XCTAssertFalse(sut.showLoading)
        XCTAssertFalse(sut.isEdition)
        XCTAssertFalse(sut.showDeleteAlert)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testInitIncome() {
        sut = NewMovementViewBaseState()
        sut.isIncome = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.newIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testInitIncomeIsEdition() {
        sut = NewMovementViewBaseState()
        sut.isIncome = true
        sut.isEdition = true
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
        XCTAssertEqual(sut.navigationBarTitle, L10n.editIncome)
    }

    func testInitExpenditure() {
        sut = NewMovementViewBaseState()
        sut.isIncome = false
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testInitExpenditureIsEdition() {
        sut = NewMovementViewBaseState()
        sut.isIncome = false
        sut.isEdition = true
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
        XCTAssertEqual(sut.navigationBarTitle, L10n.editExpenditure)
    }
}
