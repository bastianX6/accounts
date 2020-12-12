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
        Text("New movement view")
    }

    var dashboardView: some View {
        Text("Dashboard view")
    }

    var expensesView: some View {
        Text("Expenses view")
    }

    var incomesView: some View {
        Text("Incomes view")
    }
}
