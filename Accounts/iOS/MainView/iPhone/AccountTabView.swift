//
//  AccountTabView.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import AccountsCoreDataManagement
import AccountsUI
import Foundation
import MovementList_iOS
import NewMovement_iOS
import SwiftUI

struct AccountTabView: View {
    private let dashboardMenu = MenuSections.dashboard.menuElement
    private let expensesMenu = MenuSections.expenses.menuElement
    private let incomesMenu = MenuSections.incomes.menuElement
    private let newMovementMenu = MenuSections.newMovement.menuElement

    var body: some View {
        TabView {
            SectionBuilder.shared.expensesView
                .tabItem {
                    Image(systemName: self.expensesMenu.systemIcon)
                    Text(self.expensesMenu.name)
                }
                .tag(1)

            SectionBuilder.shared.incomesView
                .tabItem {
                    Image(systemName: self.incomesMenu.systemIcon)
                    Text(self.incomesMenu.name)
                }
                .tag(2)

            SectionBuilder.shared.newMovementView
                .tabItem {
                    Image(systemName: self.newMovementMenu.systemIcon)
                    Text(self.newMovementMenu.name)
                }
                .tag(3)
        }
        .accentColor(AppAppearance.shared.accentColor)
        .phoneOnlyStackNavigationView()
    }
}

struct AccountTabView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTabView()
    }
}
