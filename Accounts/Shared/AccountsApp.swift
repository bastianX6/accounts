//
//  AccountsApp.swift
//  Shared
//
//  Created by Bastián Véliz Vega on 11-09-20.
//

import SwiftUI

@main
struct AccountsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
