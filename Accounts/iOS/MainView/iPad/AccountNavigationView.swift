//
//  AccountNavigationView.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import AccountsUI
import SwiftUI

struct AccountNavigationView: View {
    @State var selectedMenu: MenuSections = MenuSections.dashboard

    var body: some View {
        NavigationView {
            self.iPadListView
            self.selectedView
        }
        .accentColor(AppAppearance.shared.accentColor)
    }

    private var iPadListView: some View {
        let elements = MenuSections.allMenus

        return List(elements) { element in
            Label(element.name, systemImage: element.systemIcon)
                .onTapGesture(count: 1, perform: {
                    self.selectedMenu = element.section
                })
        }
    }

    private var selectedView: some View {
        switch self.selectedMenu {
        case .dashboard:
            return SectionBuilder.shared.dashboardView.eraseToAnyView()
        case .expenses:
            return SectionBuilder.shared.expensesView.eraseToAnyView()
        case .incomes:
            return SectionBuilder.shared.incomesView.eraseToAnyView()
        case .newMovement:
            return SectionBuilder.shared.newMovementView.eraseToAnyView()
        }
    }
}

struct AccountNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountNavigationView()
    }
}
