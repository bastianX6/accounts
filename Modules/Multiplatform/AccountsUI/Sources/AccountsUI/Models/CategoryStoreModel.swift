//
//  CategoryStoreModel.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Foundation
import SwiftUI

/// Struct used to list categories and stores
public struct CategoryStoreModel: Identifiable {
    /// Category / Store name
    public let name: String

    /// Category / Store id
    public let id: UUID

    /// Category / Store accent color
    public let color: Color

    /// Category / Store system icon
    public let icon: String

    /// Default initializer
    /// - Parameters:
    ///   - name: category / Store name
    ///   - id: category / Store id
    ///   - color: Category / Store accent color
    ///   - icon: Category / Store system icon
    public init(name: String,
                id: UUID,
                color: Color,
                icon: String)
    {
        self.name = name
        self.id = id
        self.color = color
        self.icon = icon
    }
}

extension CategoryStoreModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case color
        case icon
    }

    // swiftlint:disable cyclomatic_complexity
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.id = try values.decode(UUID.self, forKey: .id)
        self.icon = try values.decode(String.self, forKey: .icon)

        let stringColor = try values.decode(String.self, forKey: .color)

        switch stringColor {
        case "black":
            self.color = .black
        case "blue":
            self.color = .blue
        case "clear":
            self.color = .clear
        case "gray":
            self.color = .gray
        case "green":
            self.color = .green
        case "orange":
            self.color = .orange
        case "pink":
            self.color = .pink
        case "purple":
            self.color = .purple
        case "red":
            self.color = .red
        case "white":
            self.color = .white
        case "yellow":
            self.color = .yellow
        case "indigo":
            self.color = .indigoLegacy
        case "teal":
            self.color = .tealLegacy
        default:
            self.color = .clear
        }
    }
}
