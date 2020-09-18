//
//  AccountTabView.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import AccountsCoreDataManagement
import AccountsUI
import NewMovement
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
    }

    private var newMovementView: some View {
        // TODO: Replace categories and stores by real elements
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
        var categories = [CategoryStoreModel]()
        categories.append(CategoryStoreModel(name: "Category 1", id: UUID()))
        categories.append(CategoryStoreModel(name: "Category 2", id: UUID()))
        categories.append(CategoryStoreModel(name: "Category 3", id: UUID()))

        var stores = [CategoryStoreModel]()
        stores.append(CategoryStoreModel(name: "Store 1", id: UUID()))
        stores.append(CategoryStoreModel(name: "Store 2", id: UUID()))
        stores.append(CategoryStoreModel(name: "Store 3", id: UUID()))

        let dataSource = CoreDataSourceModify()
        let dataModel = NewMovementViewDataModel(dataSource: dataSource, stores: stores, categories: categories)
        return NewMovementView(dataModel: dataModel)
    }

    private var dashboardView: some View {
        Text("Dashboard view")
    }

    private var expensesView: some View {
        Text("Expenses view")
    }

    private var incomesView: some View {
        Text("Incomes view")
    }
}

struct AccountTabView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTabView()
    }
}
