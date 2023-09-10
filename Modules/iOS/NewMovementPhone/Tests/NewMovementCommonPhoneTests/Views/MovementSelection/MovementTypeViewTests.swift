//
//  MovementTypeViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 19-12-20.
//
import Foundation
import PhoneTestUtils
import SnapshotTesting
import SwiftUI
import TestUtils
import XCTest

@testable import NewMovement

final class MovementTypeViewTests: XCTestCase {
    var sut: AnyView!

    override func setUp() async throws {
        try await super.setUp()
        sut = MovementTypeView(expenditureAction: {}, incomeAction: {})
            .eraseToAnyView()
    }

    func testDefaultLayout() {
        sut = sut
            .environment(\.colorScheme, .light)
            .eraseToAnyView()

        phoneSnapshotConfigurations.forEach { configuration in
            assertSnapshot(
                matching: sut,
                as: .image(
                    precision: defaultPixelPrecision,
                    perceptualPrecision: defaultPerceptualPrecision,
                    layout: .device(config: configuration.device)
                ),
                testName: "MovementTypeViewTests_testDefaultLayout_\(configuration.name)"
            )
        }
    }

    func testDarkLayout() {
        sut = sut
            .environment(\.colorScheme, .dark)
            .eraseToAnyView()

        phoneSnapshotConfigurations.forEach { configuration in
            assertSnapshot(
                matching: sut,
                as: .image(
                    precision: defaultPixelPrecision,
                    perceptualPrecision: defaultPerceptualPrecision,
                    layout: .device(config: configuration.device)
                ),
                testName: "MovementTypeViewTests_testDarkLayout_\(configuration.name)"
            )
        }
    }
}
