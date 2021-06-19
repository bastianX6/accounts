//
//  SectionBuilderMac.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 12-12-20.
//

import Foundation

import CoreDataManagement
import AccountsUI
import DataManagement
import Foundation
import MovementListMac
import NewMovement
import NewMovementMac
import SwiftUI

class SectionBuilderMac {
    private let incomeData: MovementResources
    private let expenditureData: MovementResources
    private let dataSourceRead: DataSourceRead
    private let dataSourceModify: DataSourceModify

    static let shared = SectionBuilderMac()

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
        return NewMovementMac.MovementTypeSelectorView(dataModel: dataModel)
    }

    var dashboardView: some View {
        Text("Dashboard view")
    }

    var expensesView: some View {
        let dataModel = MovementListDataModel(dataSourceRead: self.dataSourceRead,
                                              resources: self.expenditureData,
                                              isIncome: false)

        return MovementListMac.ContainerView(dataModel: dataModel)
    }

    var incomesView: some View {
        let dataModel = MovementListDataModel(dataSourceRead: self.dataSourceRead,
                                              resources: self.incomeData,
                                              isIncome: true)

        return MovementListMac.ContainerView(dataModel: dataModel)
    }
}
