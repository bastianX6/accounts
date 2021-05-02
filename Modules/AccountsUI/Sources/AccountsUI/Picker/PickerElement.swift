//
//  PickerElement.swift
//
//
//  Created by Bastián Véliz Vega on 12-09-20.
//

import Foundation

/// Picker element
public struct PickerElement<IdType: Hashable, ElementType>: Identifiable {
    /// Picker id. Is also use as index in a array of elements
    public let id: IdType

    /// Element used as picker source
    public let element: ElementType

    /// Default initializer
    /// - Parameters:
    ///   - id: element identifier
    ///   - element: element used as picker source
    public init(id: IdType, element: ElementType) {
        self.id = id
        self.element = element
    }
}
