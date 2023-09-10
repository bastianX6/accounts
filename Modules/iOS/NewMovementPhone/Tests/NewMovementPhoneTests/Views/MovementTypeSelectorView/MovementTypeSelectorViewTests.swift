//
//  MovementTypeSelectorViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import DependencyResolver
import Foundation
import NewMovement
import PhoneTestUtils
import Previews
import SnapshotTesting
import SwiftUI
import TestUtils
import XCTest

@testable import NewMovementPhone

class MovementTypeSelectorViewTests: XCTestCase {
    var sut: AnyView!
    var resolver: DependencyResolver!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let dataSource = MovementPreviewSpy()
        let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                 incomeData: DataFake.incomeData,
                                                 expenditureData: DataFake.expenditureData)
        sut = MovementTypeSelectorView(dataModel: dataModel)
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
                testName: "MovementTypeSelectorViewTests_testDefaultLayout_\(configuration.name)"
            )
        }
    }

    func testDarkLayout() {
        sut = sut
            .background(Color.systemGray6)
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
                testName: "MovementTypeSelectorViewTests_testDarkLayout_\(configuration.name)"
            )
        }
    }
}
