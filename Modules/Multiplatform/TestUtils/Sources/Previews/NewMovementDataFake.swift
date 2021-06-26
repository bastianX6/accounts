//
//  NewMovementDataFake.swift
//
//
//  Created by Bastián Véliz Vega on 26-06-21.
//

import DataManagement
import Foundation
import NewMovement

public enum NewMovementDataFake {
    static let categoryId = UUID()
    static let storeId = UUID()

    public static var dataModel: NewMovementViewDataModel {
        return NewMovementViewDataModel(dataSource: MovementPreview(),
                                        incomeData: DataFake.movementResources,
                                        expenditureData: DataFake.movementResources)
    }

    public static var viewModel: NewMovementViewModel {
        return NewMovementViewModel(model: self.model,
                                    dataSource: self.dataSource,
                                    incomeData: DataFake.incomeData,
                                    expenditureData: DataFake.expenditureData,
                                    onEnd: {})
    }

    public static var model: NewMovementViewInternalDataModel {
        return NewMovementViewInternalDataModel(date: Date(),
                                                currentStore: self.storeId,
                                                currentCategory: self.categoryId)
    }

    public static var modelWithData: NewMovementViewInternalDataModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: "2018-02-02") ?? Date()

        let model = NewMovementViewInternalDataModel(title: "A title",
                                                     date: date,
                                                     amount: 150_000,
                                                     comments: "Comments :)",
                                                     currentStore: self.storeId,
                                                     currentCategory: self.categoryId)
        return model
    }

    static var dataSource: DataSourceModify {
        return MovementPreview()
    }

    public static func baseViewDataModel(isIncome: Bool) -> NewMovementViewInternalDataResources {
        return NewMovementViewInternalDataResources(categories: DataFake.categories,
                                                    stores: DataFake.stores,
                                                    customDataSectionTitle: "Custom data section title",
                                                    isIncome: isIncome)
    }
}
