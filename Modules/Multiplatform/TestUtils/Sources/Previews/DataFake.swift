//
//  DataFake.swift
//
//
//  Created by Bastián Véliz Vega on 26-06-21.
//

import AccountsUI
import DataManagement
import Foundation
import MovementList
import SwiftUI

public enum DataFake {
    public static let categoryId = UUID()
    public static let storeId = UUID()

    static let creditCardFill = "creditcard.fill"

    public static var simpleCardModelArray: [MovementSimpleCardModel] {
        var array = [MovementSimpleCardModel]()
        let amount = "$ 9.999.999"

        array.append(self.getSimpleCardModel(name: "Falabella",
                                             color: .green,
                                             amount: amount))

        array.append(self.getSimpleCardModel(name: "Santander",
                                             color: .red,
                                             amount: amount))

        array.append(self.getSimpleCardModel(name: "Banco de Chile",
                                             color: .blue,
                                             amount: amount))

        array.append(self.getSimpleCardModel(name: "Otros",
                                             color: .indigoLegacy,
                                             amount: amount))

        return array
    }

    public static func getSimpleCardModel(name: String, color: Color, amount: String) -> MovementSimpleCardModel {
        return MovementSimpleCardModel(id: UUID(),
                                       name: name,
                                       amount: amount,
                                       systemImageName: self.creditCardFill,
                                       imageTintColor: color)
    }

    // MARK: - Movement previews

    public static var movement: Movement {
        return PreviewMovement(id: UUID(),
                               name: "movement 1",
                               description: "This is a movement",
                               amount: 100,
                               date: self.defaultDate,
                               isPermanent: true)
    }

    public static var movements: [Movement] {
        let date1 = Date()
        let calendar = Calendar.current
        let date2 = calendar.date(byAdding: .day, value: -2, to: date1) ?? Date()
        let movementDescription = "This is a movement"

        let movement1 = PreviewMovement(id: self.storeCategory.id,
                                        name: "movement 1",
                                        description: movementDescription,
                                        amount: 100,
                                        date: date1,
                                        isPermanent: true)
        let movement2 = PreviewMovement(id: self.storeCategory.id,
                                        name: "movement 2",
                                        description: movementDescription,
                                        amount: 200,
                                        date: date1)
        let movement3 = PreviewMovement(id: self.storeCategory.id,
                                        name: "movement 3",
                                        description: movementDescription,
                                        amount: 300,
                                        date: date1,
                                        isPermanent: true)
        let movement4 = PreviewMovement(id: self.storeCategory.id,
                                        name: "movement 4",
                                        description: movementDescription,
                                        amount: 400,
                                        date: date2)
        let movement5 = PreviewMovement(id: self.storeCategory.id,
                                        name: "movement 5",
                                        description: movementDescription,
                                        amount: 500,
                                        date: date2,
                                        isPermanent: true)
        let movement6 = PreviewMovement(id: self.storeCategory.id,
                                        name: "movement 6",
                                        description: movementDescription,
                                        amount: 600,
                                        date: date2)

        let movements = [movement1,
                         movement2,
                         movement3,
                         movement4,
                         movement5,
                         movement6]

        return movements
    }

    public static var movementDetailsModel: MovementDetailsModel {
        return MovementDetailsMapper.getModel(from: self.movements,
                                              icon: self.creditCardFill,
                                              tintColor: .indigoLegacy)
    }

    public struct PreviewMovement: Movement {
        public var id = UUID()
        public var name: String = ""
        public var description: String = ""
        public var amount: Float = 0
        public var date = Date()
        public var isPaid: Bool = false
        public var isPermanent: Bool = false
        public var storeId = UUID()
        public var categoryId = UUID()
        public var paymentId: UUID?
    }

    // MARK: - MovementSum Previews

    struct PreviewMovementSum: MovementsSum {
        public var id: UUID
        public var sum: Float
    }

    public static var movementSumArray: [MovementsSum] {
        var array = [MovementsSum]()

        array.append(PreviewMovementSum(id: self.stores[0].id, sum: 9_999_999))
        array.append(PreviewMovementSum(id: self.stores[1].id, sum: 1_111_111))
        array.append(PreviewMovementSum(id: self.stores[2].id, sum: 6_666_666))

        return array
    }

    // MARK: - Stores

    public static var storeCategory: CategoryStoreModel = {
        CategoryStoreModel(name: "Store 1", id: UUID(), color: .indigoLegacy, icon: DataFake.creditCardFill)
    }()

    public static var stores: [CategoryStoreModel] = {
        var array = [CategoryStoreModel]()
        array.append(CategoryStoreModel(name: "Store 1", id: DataFake.storeId, color: .indigoLegacy, icon: DataFake.creditCardFill))
        array.append(CategoryStoreModel(name: "Store 2", id: UUID(), color: .indigoLegacy, icon: DataFake.creditCardFill))
        array.append(CategoryStoreModel(name: "Store 3", id: UUID(), color: .indigoLegacy, icon: DataFake.creditCardFill))
        return array
    }()

    public static var categories: [CategoryStoreModel] {
        var array = [CategoryStoreModel]()
        array.append(CategoryStoreModel(name: "Category 1", id: DataFake.categoryId, color: .indigoLegacy, icon: DataFake.creditCardFill))
        array.append(CategoryStoreModel(name: "Category 2", id: UUID(), color: .indigoLegacy, icon: DataFake.creditCardFill))
        array.append(CategoryStoreModel(name: "Category 3", id: UUID(), color: .indigoLegacy, icon: DataFake.creditCardFill))
        return array
    }

    // MARK: - Resources

    public static var movementResources: MovementResources {
        return MovementResources(categories: [], stores: self.stores)
    }

    public static var dataModel: MovementDetailsDataModel {
        let movementPreview = MovementPreview()
        let date1 = Date()

        let calendar = Calendar.current
        let date2 = calendar.date(byAdding: .day, value: -2, to: date1) ?? Date()

        return MovementDetailsDataModel(categoryStoreData: self.storeCategory,
                                        isIncome: false,
                                        dataSourceRead: movementPreview,
                                        fromDate: date2,
                                        toDate: date1)
    }

    public static var incomeData: MovementResources {
        return MovementResources(categories: self.categories, stores: self.stores)
    }

    public static var expenditureData: MovementResources {
        return MovementResources(categories: self.categories, stores: self.stores)
    }

    public static var defaultDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let date = dateFormatter.date(from: "2021-08-01") else {
            fatalError("Couldn't get date")
        }
        return date
    }
}
