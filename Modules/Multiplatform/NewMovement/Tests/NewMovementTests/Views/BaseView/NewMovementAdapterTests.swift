//
//  NewMovementAdapterTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Nimble
import Quick

@testable import NewMovement

class NewMovementAdapterTests: QuickSpec {
    override func spec() {
        var sut: NewMovementAdapter!

        describe("NewMovementAdapter") {
            context("when init a new instance") {
                it("should have the right values") {
                    let dataModel = NewMovementViewInternalDataModel(date: Date(),
                                                                     currentStore: UUID(),
                                                                     currentCategory: UUID())
                    sut = NewMovementAdapter(model: dataModel)

                    expect(sut.id) == dataModel.id
                    expect(sut.name) == dataModel.title
                    expect(sut.description) == dataModel.comments
                    expect(sut.amount) == dataModel.amount.floatValue
                    expect(sut.date) == dataModel.date
                    expect(sut.isPaid) == dataModel.isPaid
                    expect(sut.isPermanent) == dataModel.isPermanent
                    expect(sut.storeId) == dataModel.currentStore
                    expect(sut.categoryId) == dataModel.currentCategory
                    expect(sut.paymentId).to(beNil())
                }
            }
        }
    }
}
