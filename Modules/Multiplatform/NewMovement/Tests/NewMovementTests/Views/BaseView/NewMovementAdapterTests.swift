//
//  NewMovementAdapterTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import XCTest

@testable import NewMovement

class NewMovementAdapterTests: XCTestCase {
    var sut: NewMovementAdapter!

    func testAdapter() {
        let dataModel = NewMovementViewInternalDataModel(date: Date(),
                                                         currentStore: UUID(),
                                                         currentCategory: UUID())
        sut = NewMovementAdapter(model: dataModel)
        XCTAssertEqual(sut.id, dataModel.id)
        XCTAssertEqual(sut.name, dataModel.title)
        XCTAssertEqual(sut.description, dataModel.comments)
        XCTAssertEqual(sut.amount, dataModel.amount.floatValue)
        XCTAssertEqual(sut.date, dataModel.date)
        XCTAssertEqual(sut.isPaid, dataModel.isPaid)
        XCTAssertEqual(sut.isPermanent, dataModel.isPermanent)
        XCTAssertEqual(sut.storeId, dataModel.currentStore)
        XCTAssertEqual(sut.categoryId, dataModel.currentCategory)
        XCTAssertNil(sut.paymentId)
    }
}
