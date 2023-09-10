//
//  MovementTypeCardTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation
import MacTestUtils
import SwiftUI
import TestUtils
import XCTest

@testable import NewMovement

final class MovementTypeCardTests: XCTestCase {
    private let referenceSize = CGSize(width: 300, height: 100)
    var sut: AnyView!

    override func setUp() async throws {
        try await super.setUp()
        sut = MovementTypeCard(systemImageName: "paperplane.fill",
                               imageTintColor: .indigo,
                               title: "A title")
            .eraseToAnyView()
    }

    func testDefaultLayout() {
        sut = sut
            .environment(\.colorScheme, .light)
            .eraseToAnyView()

        assertSnapshot(
            matching: sut,
            as: .image(
                precision: defaultPixelPrecision,
                perceptualPrecision: defaultPerceptualPrecision,
                size: referenceSize
            ),
            testName: "MovementTypeCardTests_testDefaultLayout"
        )
    }

    func testDarkLayout() {
        sut = sut
            .environment(\.colorScheme, .dark)
            .eraseToAnyView()

        assertSnapshot(
            matching: sut,
            as: .image(
                precision: defaultPixelPrecision,
                perceptualPrecision: defaultPerceptualPrecision,
                size: referenceSize
            ),
            testName: "MovementTypeCardTests_testDarkLayout"
        )
    }
}
