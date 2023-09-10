//
//  NewMovementViewInternalDataResourcesTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation
import Previews
import XCTest

@testable import NewMovement

// swiftlint:disable type_name
class NewMovementViewInternalDataResourcesTests: XCTestCase {
    // swiftlint:enable type_name

    var sut: NewMovementViewInternalDataResources!

    func testNewInstance() {
        let categories = DataFake.categories
        let stores = DataFake.stores
        let title = "title"
        let isIncome = false
        let numberFormatter = NumberFormatter()

        sut = NewMovementViewInternalDataResources(categories: categories,
                                                   stores: stores,
                                                   customDataSectionTitle:
                                                   title,
                                                   isIncome: isIncome,
                                                   numberFormatter: numberFormatter)

        XCTAssertEqual(sut.categories, categories)
        XCTAssertEqual(sut.stores, stores)
        XCTAssertEqual(sut.customDataSectionTitle, title)
        XCTAssertEqual(sut.isIncome, isIncome)
        XCTAssertEqual(sut.numberFormatter, numberFormatter)
    }

    func testNewInstanceWithDefaultValues() {
        let categories = DataFake.categories
        let stores = DataFake.stores
        let title = "title"

        sut = NewMovementViewInternalDataResources(categories: categories,
                                                   stores: stores,
                                                   customDataSectionTitle:
                                                   title)

        XCTAssertEqual(sut.categories, categories)
        XCTAssertEqual(sut.stores, stores)
        XCTAssertEqual(sut.customDataSectionTitle, title)
        XCTAssertTrue(sut.isIncome)
        XCTAssertEqual(sut.numberFormatter.numberStyle, NumberFormatter.Style.none)
        XCTAssertEqual(sut.numberFormatter.locale.identifier, "es_CL")
    }
}
