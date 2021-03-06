//
//  NewMovementViewInternalTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import DependencyResolver
import Foundation
import NewMovement
import NewMovementPreview
import Nimble
import Previews
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI

@testable import NewMovementPhone

class NewMovementViewInternalTests: QuickSpec {
    private let referenceSize = ViewImageConfig.iPhoneX.size!
    @ObservedObject var viewModel: NewMovementViewModel = NewMovementDataFake.viewModel

    // swiftlint:disable function_body_length
    override func spec() {
        var sut: AnyView!
        var resolver: DependencyResolver!

        describe("NewMovementViewInternal") {
            beforeEach {
                resolver = DependencyResolver(bundle: Bundle.main)
            }

            context("when view is created") {
                context("and isIncome is true") {
                    beforeEach {
                        self.viewModel = NewMovementDataFake.viewModelEmpty
                        let dataResources = NewMovementViewInternalDataResources(
                            categories: DataFake.categories,
                            stores: DataFake.stores,
                            customDataSectionTitle: "Custom title",
                            isIncome: true
                        )

                        sut = NewMovementViewInternal(model: self.$viewModel.model,
                                                      dataResources: dataResources)
                            .frameFromSize(self.referenceSize)
                            .environmentObject(resolver)
                            .eraseToAnyView()
                    }
                    it("should have the correct layout") {
                        sut = sut
                            .environment(\.colorScheme, .light)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }

                    it("should have the correct layout on dark mode") {
                        sut = sut
                            .background(Color.systemGray6)
                            .environment(\.colorScheme, .dark)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }
                }

                context("and isIncome is false") {
                    beforeEach {
                        self.viewModel = NewMovementDataFake.viewModelEmpty
                        let dataResources = NewMovementViewInternalDataResources(
                            categories: DataFake.categories,
                            stores: DataFake.stores,
                            customDataSectionTitle: "Custom title",
                            isIncome: false
                        )

                        sut = NewMovementViewInternal(model: self.$viewModel.model,
                                                      dataResources: dataResources)
                            .frameFromSize(self.referenceSize)
                            .environmentObject(resolver)
                            .eraseToAnyView()
                    }
                    it("should have the correct layout") {
                        sut = sut
                            .environment(\.colorScheme, .light)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }

                    it("should have the correct layout on dark mode") {
                        sut = sut
                            .background(Color.systemGray6)
                            .environment(\.colorScheme, .dark)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }
                }
            }

            context("when view is created in edition mode") {
                context("and isIncome is true") {
                    beforeEach {
                        self.viewModel = NewMovementDataFake.viewModel

                        let dataResources = NewMovementViewInternalDataResources(
                            categories: DataFake.categories,
                            stores: DataFake.stores,
                            customDataSectionTitle: "Custom title",
                            isIncome: true
                        )

                        sut = NewMovementViewInternal(model: self.$viewModel.model,
                                                      dataResources: dataResources)
                            .frameFromSize(self.referenceSize)
                            .environmentObject(resolver)
                            .eraseToAnyView()
                    }
                    it("should have the correct layout") {
                        sut = sut
                            .environment(\.colorScheme, .light)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }

                    it("should have the correct layout on dark mode") {
                        sut = sut
                            .background(Color.systemGray6)
                            .environment(\.colorScheme, .dark)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }
                }

                context("and isIncome is false") {
                    beforeEach {
                        self.viewModel = NewMovementDataFake.viewModel

                        let dataResources = NewMovementViewInternalDataResources(
                            categories: DataFake.categories,
                            stores: DataFake.stores,
                            customDataSectionTitle: "Custom title",
                            isIncome: false
                        )

                        sut = NewMovementViewInternal(model: self.$viewModel.model,
                                                      dataResources: dataResources)
                            .frameFromSize(self.referenceSize)
                            .environmentObject(resolver)
                            .eraseToAnyView()
                    }
                    it("should have the correct layout") {
                        sut = sut
                            .environment(\.colorScheme, .light)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }

                    it("should have the correct layout on dark mode") {
                        sut = sut
                            .background(Color.systemGray6)
                            .environment(\.colorScheme, .dark)
                            .eraseToAnyView()
                        expect(sut).to(haveValidSnapshot(as: .image))
                    }
                }
            }
        }
    }

    // swiftlint:enable function_body_length
}
