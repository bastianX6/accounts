//
//  SectionBuilderMac.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 12-12-20.
//

import Foundation

import AccountsCoreDataManagement
import AccountsUI
import DataManagement
import Foundation
import MovementListMacOS
import NewMovementCommon
import NewMovementMacOS
import SwiftUI

class SectionBuilderMac {
    private let incomeData: MovementResources
    private let expeditureData: MovementResources
    private let dataSourceRead: DataSourceRead
    private let dataSourceModify: DataSourceModify

    static let shared = SectionBuilderMac()

    private init() {
        guard let incomeData = try? NewMovementResourcesReeader.shared.readIncomeData() else {
            fatalError("Can't read income data")
        }

        guard let expeditureData = try? NewMovementResourcesReeader.shared.readExpeditureData() else {
            fatalError("Can't read expediture data")
        }

        self.incomeData = incomeData
        self.expeditureData = expeditureData
        self.dataSourceRead = CoreDataSourceRead()
        self.dataSourceModify = CoreDataSourceModify()
    }

    var newMovementView: some View {
        let dataModel = NewMovementViewDataModel(dataSource: self.dataSourceModify,
                                                 incomeData: self.incomeData,
                                                 expenditureData: self.expeditureData)
        return NewMovementMacOS.MovementTypeSelectorView(dataModel: dataModel)
    }

    var dashboardView: some View {
        Text("Dashboard view")
    }

    var expensesView: some View {
        let dataModel = MovementListDataModel(dataSourceRead: self.dataSourceRead,
                                              resources: self.expeditureData,
                                              isIncome: false)

        return MovementListMacOS.ContainerView(dataModel: dataModel)
    }

    var incomesView: some View {
        let dataModel = MovementListDataModel(dataSourceRead: self.dataSourceRead,
                                              resources: self.incomeData,
                                              isIncome: true)

        return MovementListMacOS.ContainerView(dataModel: dataModel)
    }
}
