//
//  MainViewMac.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 12-12-20.
//

import AccountsUI
import Foundation
import SwiftUI

struct MainViewMac: View {
    @State var selectedMenu = MenuSections.expenses

    var body: some View {
        NavigationView {
            self.listView
            self.selectedView
        }
        .accentColor(AppAppearance.shared.accentColor)
    }

    private var listView: some View {
        let elements = MenuSections.allMenus

        return List(elements) { element in
            Label(element.name, systemImage: element.systemIcon)
                .onTapGesture(count: 1, perform: {
                    self.selectedMenu = element.section
                })
        }
        .navigationTitle(L10n.myAccounts)
    }

    private var selectedView: some View {
        switch self.selectedMenu {
        case .dashboard:
            return SectionBuilderMac.shared.dashboardView.eraseToAnyView()
        case .expenses:
            return SectionBuilderMac.shared.expensesView.eraseToAnyView()
        case .incomes:
            return SectionBuilderMac.shared.incomesView.eraseToAnyView()
        case .newMovement:
            return SectionBuilderMac.shared.newMovementView.eraseToAnyView()
        }
    }
}

struct MainViewMac_Previews: PreviewProvider {
    static var previews: some View {
        MainViewMac()
    }
}
