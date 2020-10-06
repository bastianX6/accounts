//
//  AccountsApp.swift
//  Shared
//
//  Created by Bastián Véliz Vega on 12-09-20.
//

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
            return AnyView(AccountTabView())
        #else
            return AnyView(Text("Main view"))
        #endif
    }
}
