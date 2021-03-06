//
//  NewMovementViewInternalDataResourcesTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation
import Nimble
import Quick
import Previews

@testable import NewMovement

// swiftlint:disable type_name
class NewMovementViewInternalDataResourcesTests: QuickSpec {
// swiftlint:enable type_name
    override func spec() {
        var sut: NewMovementViewInternalDataResources!

        describe("NewMovementViewInternalDataResources") {
            context("when init a new instance") {
                it("should have the right values") {
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

                    expect(sut.categories) == categories
                    expect(sut.stores) == stores
                    expect(sut.customDataSectionTitle) == title
                    expect(sut.isIncome) == isIncome
                    expect(sut.numberFormatter) == numberFormatter
                }

                it("should have the right values if default values are not replaced") {
                    let categories = DataFake.categories
                    let stores = DataFake.stores
                    let title = "title"

                    sut = NewMovementViewInternalDataResources(categories: categories,
                                                               stores: stores,
                                                               customDataSectionTitle:
                                                               title)

                    expect(sut.categories) == categories
                    expect(sut.stores) == stores
                    expect(sut.customDataSectionTitle) == title
                    expect(sut.isIncome).to(beTrue())
                    expect(sut.numberFormatter.numberStyle) == NumberFormatter.Style.none
                    expect(sut.numberFormatter.locale.identifier) == "es_CL"
                }
            }
        }
    }
}
