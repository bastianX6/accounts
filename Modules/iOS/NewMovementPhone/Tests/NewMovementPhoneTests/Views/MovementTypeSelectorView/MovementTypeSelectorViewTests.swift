//
//  MovementTypeSelectorViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import Foundation
import NewMovement
import Nimble
import PhoneTestUtils
import Previews
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI
import TestUtils

@testable import NewMovementPhone

class MovementTypeSelectorViewTests: QuickSpec {
    private let referenceSize = ViewImageConfig.iPhoneX.size!

    override func spec() {
        var sut: AnyView!

        describe("MovementTypeSelectorView") {
            beforeEach {
                let dataSource = MovementPreviewSpy()
                let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                         incomeData: DataFake.incomeData,
                                                         expenditureData: DataFake.expenditureData)
                sut = MovementTypeSelectorView(dataModel: dataModel)
                    .frameFromSize(self.referenceSize)
                    .eraseToAnyView()
            }

            context("when view is created") {
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
