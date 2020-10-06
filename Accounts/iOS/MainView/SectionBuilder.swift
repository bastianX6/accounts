//
//  SectionBuilder.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import AccountsCoreDataManagement
import AccountsUI
import DataManagement
import Foundation
import MovementList_iOS
import NewMovement_iOS
import SwiftUI

class SectionBuilder {
    private let incomeData: MovementResources
    private let expeditureData: MovementResources
    private let dataSourceRead: DataSourceRead
    private let dataSourceModify: DataSourceModify

    static let shared = SectionBuilder()

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
                                                 expeditureData: self.expeditureData)
        return NewMovement_iOS.ContainerView(dataModel: dataModel)
    }

    var dashboardView: some View {
        Text("Dashboard view")
    }

    var expensesView: some View {
        let dataModel = MovementListDataModel(dataSource: self.dataSourceRead,
                                              resources: self.expeditureData,
                                              isIncome: false)

        return MovementList_iOS.ContainerView(dataModel: dataModel)
    }

    var incomesView: some View {
        let dataModel = MovementListDataModel(dataSource: self.dataSourceRead,
                                              resources: self.incomeData,
                                              isIncome: true)

        return MovementList_iOS.ContainerView(dataModel: dataModel)
    }
}
