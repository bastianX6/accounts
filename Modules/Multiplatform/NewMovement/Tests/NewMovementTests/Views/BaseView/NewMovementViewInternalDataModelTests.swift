//
//  NewMovementViewInternalDataModelTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import XCTest

@testable import NewMovement

class NewMovementViewInternalDataModelTests: XCTestCase {
    var sut: NewMovementViewInternalDataModel!

    func testDefaultInitializer() {
        let id = UUID()
        let title = ""
        let date = Date()
        let amount: NSNumber = 1000
        let comments = ""
        let isPaid = false
        let isPermanent = false
        let currentStore = UUID()
        let currentCategory = UUID()
        let isNew = true

        sut = NewMovementViewInternalDataModel(id: id,
                                               title: title,
                                               date: date,
                                               amount: amount,
                                               comments: comments,
                                               isPaid: isPaid,
                                               isPermanent: isPermanent,
                                               currentStore: currentStore,
                                               currentCategory: currentCategory,
                                               isNew: isNew)

        XCTAssertEqual(sut.id, id)
        XCTAssertEqual(sut.title, title)
        XCTAssertEqual(sut.date, date)
        XCTAssertEqual(sut.amount, amount)
        XCTAssertEqual(sut.comments, comments)
        XCTAssertEqual(sut.isPaid, isPaid)
        XCTAssertEqual(sut.isPermanent, isPermanent)
        XCTAssertEqual(sut.currentStore, currentStore)
        XCTAssertEqual(sut.currentCategory, currentCategory)
        XCTAssertEqual(sut.isNew, isNew)
    }

    func testConvenienceInitializer() {
        let movement = MockMovement()

        sut = NewMovementViewInternalDataModel(movement: movement)

        XCTAssertEqual(sut.id, movement.id)
        XCTAssertEqual(sut.title, movement.name)
        XCTAssertEqual(sut.date, movement.date)
        XCTAssertEqual(sut.amount, NSNumber(value: movement.amount))
        XCTAssertEqual(sut.comments, movement.description)
        XCTAssertEqual(sut.isPaid, movement.isPaid)
        XCTAssertEqual(sut.isPermanent, movement.isPermanent)
        XCTAssertEqual(sut.currentStore, movement.storeId)
        XCTAssertEqual(sut.currentCategory, movement.categoryId)
        XCTAssertFalse(sut.isNew)
    }
}
