//
//  NewMovementViewInternalIncomeTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import DependencyResolver
import Foundation
import NewMovement
import NewMovementPreview
import PhoneTestUtils
import Previews
import SnapshotTesting
import SwiftUI
import TestUtils
import XCTest

@testable import NewMovementPhone

class NewMovementViewInternalIncomeTests: XCTestCase {
    @ObservedObject var viewModel: NewMovementViewModel = NewMovementDataFake.viewModel
    var sut: AnyView!
    var resolver: DependencyResolver!

    override func setUpWithError() throws {
        try super.setUpWithError()
        resolver = DependencyResolver(bundle: Bundle.main)
    }

    func testDefaultLayout() {
        setupNewMovementData()
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
                testName: "NewMovementViewInternalIncomeTests_testDefaultLayout_\(configuration.name)"
            )
        }
    }

    func testDarkLayout() {
        setupNewMovementData()
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
                testName: "NewMovementViewInternalIncomeTests_testDarkLayout_\(configuration.name)"
            )
        }
    }

    func testDefaultLayoutOnEdit() {
        setupEditMovementData()
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
                testName: "NewMovementViewInternalIncomeTests_testDefaultLayoutOnEdit_\(configuration.name)"
            )
        }
    }

    func testDarkLayoutOnEdit() {
        setupEditMovementData()
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
                testName: "NewMovementViewInternalIncomeTests_testDarkLayoutOnEdit_\(configuration.name)"
            )
        }
    }

    private func setupNewMovementData() {
        viewModel = NewMovementDataFake.viewModelEmpty
        let dataResources = NewMovementViewInternalDataResources(
            categories: DataFake.categories,
            stores: DataFake.stores,
            customDataSectionTitle: "Custom title",
            isIncome: true
        )

        sut = NewMovementViewInternal(model: $viewModel.model,
                                      dataResources: dataResources)
            .environmentObject(resolver)
            .eraseToAnyView()
    }

    private func setupEditMovementData() {
        viewModel = NewMovementDataFake.viewModel

        let dataResources = NewMovementViewInternalDataResources(
            categories: DataFake.categories,
            stores: DataFake.stores,
            customDataSectionTitle: "Custom title",
            isIncome: true
        )

        sut = NewMovementViewInternal(model: $viewModel.model,
                                      dataResources: dataResources)
            .environmentObject(resolver)
            .eraseToAnyView()
    }
}
