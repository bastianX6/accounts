//
//  NewMovementResources.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import AccountsUI
import Foundation

class NewMovementResourcesReader {
    private let incomeDataFileName = "IncomeData"
    private let expenditureDataFileName = "ExpeditureData"
    private let fileExtension = "json"

    static let shared = NewMovementResourcesReader()

    private init() {
        // private init
    }

    func readIncomeData() throws -> MovementResources {
        return try self.readData(fileName: self.incomeDataFileName)
    }

    func readExpenditureData() throws -> MovementResources {
        return try self.readData(fileName: self.expenditureDataFileName)
    }

    private func readData(fileName: String) throws -> MovementResources {
        guard let url = Bundle(for: NewMovementResourcesReader.self)
            .url(forResource: fileName, withExtension: self.fileExtension)
        else {
            fatalError("Can't data url for file: \(fileName)")
        }
        let data = try Data(contentsOf: url)
        let entity = try JSONDecoder().decode(MovementResources.self, from: data)

        return entity
    }
}
