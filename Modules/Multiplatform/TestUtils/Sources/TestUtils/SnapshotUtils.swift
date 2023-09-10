//
//  SnapshotUtils.swift
//
//
//  Created by Bastián Véliz Vega on 08-09-23.
//

import Foundation
import SnapshotTesting
import XCTest

public var defaultPixelPrecision: Float = 1.0
public var defaultPerceptualPrecision: Float = 0.90

public func assertSnapshot<Value, Format>(
    matching value: @autoclosure () throws -> Value,
    as snapshotting: Snapshotting<Value, Format>,
    named name: String? = nil,
    record recording: Bool = false,
    snapshotDirectory: String? = nil,
    timeout: TimeInterval = 5,
    file: StaticString = #filePath,
    testName: String = #function,
    line: UInt = #line
) {
    let failure: String? = try verifySnapshot(
        matching: value(),
        as: snapshotting,
        named: name,
        record: recording,
        snapshotDirectory: snapshotDirectory,
        timeout: timeout,
        file: file,
        testName: testName,
        line: line
    )
    guard let message = failure else {
        return
    }
    XCTFail(message,
            file: file,
            line: line)
}
