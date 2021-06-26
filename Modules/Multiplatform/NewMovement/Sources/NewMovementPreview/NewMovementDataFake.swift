//
//  NewMovementDataFake.swift
//
//
//  Created by Bastián Véliz Vega on 26-06-21.
//

import DataManagement
import Foundation
import NewMovement
import Previews

public enum NewMovementDataFake {
    public static var dataModel: NewMovementViewDataModel {
        return NewMovementViewDataModel(dataSource: MovementPreview(),
                                        incomeData: DataFake.movementResources,
                                        expenditureData: DataFake.movementResources)
    }

    public static var viewModel: NewMovementViewModel {
        return NewMovementViewModel(model: self.modelWithData,
                                    dataSource: self.dataSource,
                                    incomeData: DataFake.incomeData,
                                    expenditureData: DataFake.expenditureData,
                                    onEnd: {})
    }

    public static var model: NewMovementViewInternalDataModel {
        return NewMovementViewInternalDataModel(date: DataFake.defaultDate,
                                                currentStore: DataFake.storeId,
                                                currentCategory: DataFake.categoryId)
    }

    public static var modelWithData: NewMovementViewInternalDataModel {
        let model = NewMovementViewInternalDataModel(title: "A title",
                                                     date: DataFake.defaultDate,
                                                     amount: 150_000,
                                                     comments: "Comments :)",
                                                     currentStore: DataFake.storeId,
                                                     currentCategory: DataFake.categoryId)
        return model
    }

    public static var viewModelEmpty: NewMovementViewModel {
        return NewMovementViewModel(dataSource: self.dataSource,
                                    incomeData: DataFake.incomeData,
                                    expenditureData: DataFake.expenditureData,
                                    movementDate: DataFake.defaultDate,
                                    onEnd: {})
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
