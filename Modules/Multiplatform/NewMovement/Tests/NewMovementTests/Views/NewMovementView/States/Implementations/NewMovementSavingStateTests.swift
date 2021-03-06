//
//  NewMovementSavingStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation
import Nimble
import Previews
import Quick
import TestUtils

@testable import NewMovement

class NewMovementSavingStateTests: QuickSpec {
    // swiftlint:disable function_body_length
    override func spec() {
        var sut: NewMovementSavingState!

        describe("NewMovementSavingState") {
            context("when init a new instance") {
                it("should have the right values") {
                    sut = NewMovementSavingState(viewModel: nil)

                    expect(sut.isIncome).to(beFalse())
                    expect(sut.showLoading).to(beTrue())
                    expect(sut.isEdition).to(beFalse())
                    expect(sut.showDeleteAlert).to(beFalse())
                    expect(sut.error).to(beNil())
                    expect(sut.navigationBarTitle) == L10n.newExpenditure
                    expect(sut.movementDetailTitle) == L10n.expenditureDetails
                }

                context("and is income is true") {
                    beforeEach {
                        sut = NewMovementSavingState(viewModel: nil)
                        sut.isIncome = true
                    }
                    it("should have the right navigation bar title if is edition is false") {
                        expect(sut.navigationBarTitle) == L10n.newIncome
                    }

                    it("should have the right navigation bar title if is edition is true") {
                        sut.isEdition = true
                        expect(sut.navigationBarTitle) == L10n.editIncome
                    }

                    it("should have the right movement detail title") {
                        expect(sut.movementDetailTitle) == L10n.incomeDetails
                    }
                }

                context("and is income is false") {
                    beforeEach {
                        sut = NewMovementSavingState(viewModel: nil)
                    }
                    it("should have the right navigation bar title if is edition is false") {
                        expect(sut.navigationBarTitle) == L10n.newExpenditure
                    }

                    it("should have the right navigation bar title if is edition is true") {
                        sut.isEdition = true
                        expect(sut.navigationBarTitle) == L10n.editExpenditure
                    }

                    it("should have the right movement detail title") {
                        expect(sut.movementDetailTitle) == L10n.expenditureDetails
                    }
                }
            }
            context("when saveAction is called") {
                it("should set end state in view model if storage was successful") {
                    let dataSource = MovementPreviewSpy()
                    let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                                 incomeData: DataFake.incomeData,
                                                                 expenditureData: DataFake.expenditureData,
                                                                 onEnd: {})

                    sut = NewMovementSavingState(viewModel: mockViewModel)

                    sut.saveAction()

                    expect(mockViewModel.currentStateEnum.representation).toEventually(be(NewMovementViewStateEnum.end.representation))
                }

                it("should set error state in view model if storage fails") {
                    let dataSource = MovementPreviewSpy()
                    dataSource.saveSuccess = false
                    let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                                 incomeData: DataFake.incomeData,
                                                                 expenditureData: DataFake.expenditureData,
                                                                 onEnd: {})

                    sut = NewMovementSavingState(viewModel: mockViewModel)

                    sut.saveAction()

                    expect(mockViewModel.currentStateEnum.representation).toEventually(be(NewMovementViewStateEnum.error(error: nil).representation))
                }
            }
        }
    }
}
