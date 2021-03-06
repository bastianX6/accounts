//
//  MovementTypeCardTests.swift
//
//
//  Created by Bastián Véliz Vega on 20-12-20.
//

import Foundation
import Nimble
import PhoneTestUtils
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI
import XCTest

@testable import NewMovement

final class MovementTypeCardTests: QuickSpec {
    private let referenceSize = CGSize(width: 300, height: 100)

    override func spec() {
        var view: AnyView!

        describe("MovementTypeCard") {
            beforeEach {
                view = MovementTypeCard(systemImageName: "paperplane.fill",
                                        imageTintColor: .indigo,
                                        title: "A title")
                    .frameFromSize(self.referenceSize)
                    .eraseToAnyView()
            }

            context("when view is created") {
                it("should have the correct layout") {
                    view = view
                        .environment(\.colorScheme, .light)
                        .eraseToAnyView()
                    expect(view).to(haveValidSnapshot(as: .image))
                }

                it("should have the correct layout on dark mode") {
                    view = view
                        .environment(\.colorScheme, .dark)
                        .eraseToAnyView()
                    expect(view).to(haveValidSnapshot(as: .image))
                }
            }
        }
    }
}
