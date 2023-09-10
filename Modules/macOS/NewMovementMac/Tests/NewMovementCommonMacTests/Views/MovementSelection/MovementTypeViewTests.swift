//
//  MovementTypeViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 19-12-20.
//

import Foundation
import MacTestUtils
import SwiftUI
import TestUtils
import XCTest

@testable import NewMovement

final class MovementTypeViewTests: XCTestCase {
    private let referenceSize = CGSize(width: 400, height: 500)
    var sut: AnyView!

    override func setUp() async throws {
        try await super.setUp()
        sut = MovementTypeView(expenditureAction: {}, incomeAction: {})
            .frame(width: referenceSize.width, height: referenceSize.height)
            .eraseToAnyView()
    }

    func testDefaultLayout() {
        sut = sut
            .background(Color.systemGray6)
            .environment(\.colorScheme, .dark)
            .eraseToAnyView()

        assertSnapshot(
            matching: sut,
            as: .image(
                precision: defaultPixelPrecision,
                perceptualPrecision: defaultPerceptualPrecision,
                size: referenceSize
            ),
            testName: "MovementTypeViewTests_testDefaultLayout"
        )
    }
}
