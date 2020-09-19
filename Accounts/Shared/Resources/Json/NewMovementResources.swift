//
//  NewMovementResources.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import NewMovement
import Foundation

class NewMovementResourcesReeader {
    private let incomeDataFileName = "IncomeData"
    private let expeditureDataFileName = "ExpeditureData"
    private let fileExtension = "json"

    static let shared = NewMovementResourcesReeader()

    private init() {}

    func readIncomeData() throws -> NewMovementResources {
        return try self.readData(fileName: self.incomeDataFileName)
    }

    func readExpeditureData() throws -> NewMovementResources {
        return try self.readData(fileName: self.expeditureDataFileName)
    }

    private func readData(fileName: String) throws -> NewMovementResources {
        guard let url = Bundle(for: NewMovementResourcesReeader.self)
            .url(forResource: fileName, withExtension: self.fileExtension) else {
            fatalError("Can't data url for file: \(fileName)")
        }
        let data = try Data(contentsOf: url)
        let entity = try JSONDecoder().decode(NewMovementResources.self, from: data)

        return entity
    }
}
