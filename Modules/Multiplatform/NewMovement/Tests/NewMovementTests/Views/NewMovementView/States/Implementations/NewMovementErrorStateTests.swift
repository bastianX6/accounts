//
//  NewMovementErrorStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Previews
import TestUtils
import XCTest

@testable import NewMovement

class NewMovementErrorStateTests: XCTestCase {
    var sut: NewMovementErrorState!

    func testDefaultInit() {
        sut = NewMovementErrorState(viewModel: nil)

        XCTAssertFalse(sut.isIncome)
        XCTAssertFalse(sut.showLoading)
        XCTAssertFalse(sut.isEdition)
        XCTAssertFalse(sut.showDeleteAlert)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitIncome() {
        sut = NewMovementErrorState(viewModel: nil)
        sut.isIncome = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.newIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitOnEditIncome() {
        sut = NewMovementErrorState(viewModel: nil)
        sut.isIncome = true
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitExpenditure() {
        sut = NewMovementErrorState(viewModel: nil)
        sut.isIncome = false
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitOnEditExpenditure() {
        sut = NewMovementErrorState(viewModel: nil)
        sut.isIncome = false
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testCancelActionCall() {
        let dataSource = MovementPreview()
        let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                     incomeData: DataFake.incomeData,
                                                     expenditureData: DataFake.expenditureData,
                                                     onEnd: {})

        sut = NewMovementErrorState(viewModel: mockViewModel)

        sut.cancelAction()
        XCTAssertEqual(mockViewModel.currentStateEnum.representation, NewMovementViewStateEnum.end.representation)
    }
}
