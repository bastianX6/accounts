//
//  AccountTabView.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import AccountsCoreDataManagement
import AccountsUI
import MovementList_iOS
import NewMovement_iOS
import SwiftUI

struct AccountTabView: View {
    var body: some View {
        TabView {
            self.dashboardView
                .tabItem {
                    Image(systemName: "rectangle.stack.person.crop.fill")
                    Text(L10n.overview)
                }
                .tag(0)

            self.expensesView
                .tabItem {
                    Image(systemName: "bag.badge.minus")
                    Text(L10n.expenses)
                }
                .tag(1)

            self.incomesView
                .tabItem {
                    Image(systemName: "dollarsign.square.fill")
                    Text(L10n.incomes)
                }
                .tag(2)

            self.newMovementView
                .tabItem {
                    Image(systemName: "cart.fill.badge.plus")
                    Text(L10n.add)
                }
                .tag(3)
        }
        .accentColor(AppAppearance.shared.accentColor)
        .phoneOnlyStackNavigationView()
    }

    private var newMovementView: some View {
        guard let incomeData = try? NewMovementResourcesReeader.shared.readIncomeData() else {
            fatalError("Can't read income data")
        }

        guard let expeditureData = try? NewMovementResourcesReeader.shared.readExpeditureData() else {
            fatalError("Can't read expediture data")
        }

        let dataSource = CoreDataSourceModify()
        let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                 incomeData: incomeData,
                                                 expeditureData: expeditureData)
        return NewMovement_iOS.ContainerView(dataModel: dataModel)
    }

    private var dashboardView: some View {
        Text("Dashboard view")
    }

    private var expensesView: some View {
        guard let expeditureData = try? NewMovementResourcesReeader.shared.readExpeditureData() else {
            fatalError("Can't read expediture data")
        }

        let dataSource = CoreDataSourceRead()

        let dataModel = MovementListDataModel(dataSource: dataSource,
                                              resources: expeditureData,
                                              isIncome: false)

        return MovementList_iOS.ContainerView(dataModel: dataModel)
    }

    private var incomesView: some View {
        guard let incomeData = try? NewMovementResourcesReeader.shared.readIncomeData() else {
            fatalError("Can't read income data")
        }

        let dataSource = CoreDataSourceRead()

        let dataModel = MovementListDataModel(dataSource: dataSource,
                                              resources: incomeData,
                                              isIncome: true)

        return MovementList_iOS.ContainerView(dataModel: dataModel)
    }
}

struct AccountTabView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTabView()
    }
}
