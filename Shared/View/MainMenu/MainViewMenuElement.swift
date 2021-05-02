//
//  MainViewMenuElement.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import Foundation

struct MainViewMenuElement: Identifiable {
    let id: UUID = UUID()
    let name: String
    let systemIcon: String
    let section: MenuSections
}
