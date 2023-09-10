//
//  SnapshotUtils.swift
//  
//
//  Created by Bastián Véliz Vega on 08-09-23.
//
#if canImport(UIKit)
import SnapshotTesting
import XCTest

public let phoneSnapshotConfigurations: [SnapshotConfiguration] = [
    .init(name: "iPhone8", device: .iPhone8),
    .init(name: "iPhoneX", device: .iPhoneX),
    .init(name: "iPhoneSE", device: .iPhoneSe)
]
#endif
