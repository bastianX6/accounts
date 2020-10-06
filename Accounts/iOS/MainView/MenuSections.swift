//
//  MenuSections.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import Foundation

enum MenuSections: CaseIterable {
    case dashboard
    case expenses
    case incomes
    case newMovement
}

extension MenuSections {
    var menuElement: MainViewMenuElement {
        switch self {
        case .dashboard:
            return MainViewMenuElement(name: L10n.overview,
                                       systemIcon: "rectangle.stack.person.crop.fill",
                                       section: self)
        case .expenses:
            return MainViewMenuElement(name: L10n.expenses,
                                       systemIcon: "bag.badge.minus",
                                       section: self)
        case .incomes:
            return MainViewMenuElement(name: L10n.incomes,
                                       systemIcon: "dollarsign.square.fill",
                                       section: self)
        case .newMovement:
            return MainViewMenuElement(name: L10n.add,
                                       systemIcon: "cart.fill.badge.plus",
                                       section: self)
        }
    }

    static var allMenus: [MainViewMenuElement] {
        return MenuSections.allCases.map { $0.menuElement }
    }
}
