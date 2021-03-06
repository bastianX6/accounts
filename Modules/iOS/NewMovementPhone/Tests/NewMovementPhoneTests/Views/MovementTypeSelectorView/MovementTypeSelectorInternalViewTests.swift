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
import Nimble
import Previews
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI
import TestUtils

@testable import NewMovementPhone

class MovementTypeSelectorInternalViewTests: QuickSpec {
    private let referenceSize = ViewImageConfig.iPhoneX.size!

    override func spec() {
        var sut: AnyView!
        var view: MovementTypeSelectorInternalView!
        var resolver: DependencyResolver!

        describe("MovementTypeSelectorInternalView") {
            beforeEach {
                resolver = DependencyResolver(bundle: Bundle.main)
            }

            context("when view is created") {
                beforeEach {
                    let dataSource = MovementPreviewSpy()
                    let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                             incomeData: DataFake.incomeData,
                                                             expenditureData: DataFake.expenditureData)
                    view = MovementTypeSelectorInternalView(dataModel: dataModel)
                    sut = view
                        .frameFromSize(self.referenceSize)
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
