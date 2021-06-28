//
//  SectionBuilder.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import CoreDataManagement
import AccountsUI
import DataManagement
import Foundation
import MovementListPhone
import NewMovementPhone
import NewMovement
import SwiftUI

class SectionBuilder {
    private let incomeData: MovementResources
    private let expenditureData: MovementResources
    private let dataSourceRead: DataSourceRead
    private let dataSourceModify: DataSourceModify

    static let shared = SectionBuilder()

    private init() {
        guard let incomeData = try? NewMovementResourcesReader.shared.readIncomeData() else {
            fatalError("Can't read income data")
        }

        guard let expenditureData = try? NewMovementResourcesReader.shared.readExpenditureData() else {
            fatalError("Can't read expenditure data")
        }

        self.incomeData = incomeData
        self.expenditureData = expenditureData
        self.dataSourceRead = CoreDataSourceRead()
        self.dataSourceModify = CoreDataSourceModify()
    }

    var newMovementView: some View {
        let dataModel = NewMovementViewDataModel(dataSource: self.dataSourceModify,
                                                 incomeData: self.incomeData,
                                                 expenditureData: self.expenditureData)
        return NewMovementPhone.MovementTypeSelectorView(dataModel: dataModel)
    }

    var dashboardView: some View {
        Text("Dashboard view")
    }

    var expensesView: some View {
        let dataModel = MovementListDataModel(dataSourceRead: self.dataSourceRead,
                                              resources: self.expenditureData,
                                              isIncome: false)

        return MovementListPhone.ContainerView(dataModel: dataModel)
    }

    var incomesView: some View {
        let dataModel = MovementListDataModel(dataSourceRead: self.dataSourceRead,
                                              resources: self.incomeData,
                                              isIncome: true)

        return MovementListPhone.ContainerView(dataModel: dataModel)
    }
}
