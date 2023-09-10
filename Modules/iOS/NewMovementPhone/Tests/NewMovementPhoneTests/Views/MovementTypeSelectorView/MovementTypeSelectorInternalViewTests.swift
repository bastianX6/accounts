//
//  MovementTypeSelectorInternalViewTests.swift
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

class MovementTypeSelectorInternalViewTests: XCTestCase {
    private let referenceSize = ViewImageConfig.iPhoneX.size!

    var sut: AnyView!
    var view: MovementTypeSelectorInternalView!
    var resolver: DependencyResolver!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let dataSource = MovementPreviewSpy()
        let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                 incomeData: DataFake.incomeData,
                                                 expenditureData: DataFake.expenditureData)
        view = MovementTypeSelectorInternalView(dataModel: dataModel)
        sut = view
            .frameFromSize(referenceSize)
            .eraseToAnyView()
        resolver = DependencyResolver(bundle: Bundle.main)
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
                    perceptualPrecision: defaultPerceptualPrecision
                ),
                testName: "MovementTypeSelectorInternalViewTests_testDefaultLayout_\(configuration.name)"
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
                    perceptualPrecision: defaultPerceptualPrecision
                ),
                testName: "MovementTypeSelectorInternalViewTests_testDarkLayout_\(configuration.name)"
            )
        }
    }
}
