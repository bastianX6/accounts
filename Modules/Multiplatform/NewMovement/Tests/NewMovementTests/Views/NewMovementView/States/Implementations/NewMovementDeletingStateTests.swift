//
//  NewMovementDeletingStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Previews
import TestUtils
import XCTest

@testable import NewMovement

class NewMovementDeletingStateTests: XCTestCase {
    var sut: NewMovementDeletingState!

    func testDefaultInit() {
        sut = NewMovementDeletingState(viewModel: nil)

        XCTAssertFalse(sut.isIncome)
        XCTAssertTrue(sut.showLoading)
        XCTAssertFalse(sut.isEdition)
        XCTAssertFalse(sut.showDeleteAlert)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitIncome() {
        sut = NewMovementDeletingState(viewModel: nil)
        sut.isIncome = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.newIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitOnEditIncome() {
        sut = NewMovementDeletingState(viewModel: nil)
        sut.isIncome = true
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editIncome)
        XCTAssertEqual(sut.movementDetailTitle, L10n.incomeDetails)
    }

    func testDefaultInitExpenditure() {
        sut = NewMovementDeletingState(viewModel: nil)
        sut.isIncome = false
        XCTAssertEqual(sut.navigationBarTitle, L10n.newExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDefaultInitOnEditExpenditure() {
        sut = NewMovementDeletingState(viewModel: nil)
        sut.isIncome = false
        sut.isEdition = true
        XCTAssertEqual(sut.navigationBarTitle, L10n.editExpenditure)
        XCTAssertEqual(sut.movementDetailTitle, L10n.expenditureDetails)
    }

    func testDeleteActionSuccess() {
        let expect = expectation(description: "wait for successfull delete action")
        let dataSource = MovementPreview()
        let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                     incomeData: DataFake.incomeData,
                                                     expenditureData: DataFake.expenditureData,
                                                     onEnd: {})
        mockViewModel.expect = expect

        sut = NewMovementDeletingState(viewModel: mockViewModel)
        sut.deleteAction()

        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(mockViewModel.currentStateEnum.representation, NewMovementViewStateEnum.end.representation)
    }

    func testDeleteActionFailure() {
        let expect = expectation(description: "wait for failed delete action")
        let dataSource = MovementPreviewSpy()
        dataSource.deleteSuccess = false
        let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                     incomeData: DataFake.incomeData,
                                                     expenditureData: DataFake.expenditureData,
                                                     onEnd: {})
        mockViewModel.expect = expect

        sut = NewMovementDeletingState(viewModel: mockViewModel)
        sut.deleteAction()

        wait(for: [expect], timeout: 1.0)
        XCTAssertEqual(mockViewModel.currentStateEnum.representation, NewMovementViewStateEnum.error(error: nil).representation)
    }
}
