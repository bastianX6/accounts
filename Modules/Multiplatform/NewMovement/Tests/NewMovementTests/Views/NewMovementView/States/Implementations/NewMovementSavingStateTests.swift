//
//  NewMovementSavingStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation
import Previews
import TestUtils
import XCTest

@testable import NewMovement

class NewMovementSavingStateTests: XCTestCase {
    var sut: NewMovementSavingState!

    func testDefaultInit() {
        sut = NewMovementSavingState(viewModel: nil)

        XCTAssertFalse(sut.isIncome)
        XCTAssertTrue(sut.showLoading)
        XCTAssertFalse(sut.isEdition)
        XCTAssertFalse(sut.showDeleteAlert)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitIncome() {
        sut = NewMovementSavingState(viewModel: nil)
        sut.isIncome = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.newIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitOnEditIncome() {
        sut = NewMovementSavingState(viewModel: nil)
        sut.isIncome = true
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitExpenditure() {
        sut = NewMovementSavingState(viewModel: nil)
        sut.isIncome = false
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitOnEditExpenditure() {
        sut = NewMovementSavingState(viewModel: nil)
        sut.isIncome = false
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testSaveActionSuccess() {
        let expect = expectation(description: "wait for successfull save action")
        let dataSource = MovementPreviewSpy()
        let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                     incomeData: DataFake.incomeData,
                                                     expenditureData: DataFake.expenditureData,
                                                     onEnd: {})
        mockViewModel.expect = expect

        sut = NewMovementSavingState(viewModel: mockViewModel)
        sut.saveAction()

        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(mockViewModel.currentStateEnum.representation, NewMovementViewStateEnum.end.representation)
    }

    func testSaveActionFailure() {
        let expect = expectation(description: "wait for failed save action")
        let dataSource = MovementPreviewSpy()
        dataSource.saveSuccess = false
        let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                     incomeData: DataFake.incomeData,
                                                     expenditureData: DataFake.expenditureData,
                                                     onEnd: {})
        mockViewModel.expect = expect

        sut = NewMovementSavingState(viewModel: mockViewModel)
        sut.saveAction()

        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(mockViewModel.currentStateEnum.representation, NewMovementViewStateEnum.error(error: nil).representation)
    }
}
