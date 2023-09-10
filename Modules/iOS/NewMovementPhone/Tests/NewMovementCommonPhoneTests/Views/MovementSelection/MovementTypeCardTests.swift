//
//  MovementTypeCardTests.swift
//
//
//  Created by Bastián Véliz Vega on 20-12-20.
//

import Foundation
import PhoneTestUtils
import SnapshotTesting
import SwiftUI
import XCTest
import TestUtils

@testable import NewMovement

final class MovementTypeCardTests: XCTestCase {
    private let referenceSize = CGSize(width: 300, height: 100)
    var sut: AnyView!

    override func setUp() async throws {
        try await super.setUp()
        sut = MovementTypeCard(systemImageName: "paperplane.fill",
                                imageTintColor: .indigoLegacy,
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
                layout: .fixed(width: referenceSize.width, height: referenceSize.height)
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
                layout: .fixed(width: referenceSize.width, height: referenceSize.height)
            ),
            testName: "MovementTypeCardTests_testDarkLayout"
        )
    }
}
