//
//  AccountsApp.swift
//  Shared
//
//  Created by Bastián Véliz Vega on 12-09-20.
//

import AccountsUI
import SwiftUI

@main
struct AccountsApp: App {
    var body: some Scene {
        WindowGroup {
            self.mainView
        }
    }

    private var mainView: some View {
        #if os(iOS)
            return MainView_iPhone().eraseToAnyView()
        #else
            return Text("Main view").eraseToAnyView()
        #endif
    }
}
