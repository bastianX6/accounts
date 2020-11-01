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
    #if !os(macOS)
        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif

    var body: some Scene {
        WindowGroup {
            self.mainView
        }
    }

    private var mainView: some View {
        #if os(iOS)
            return MainView_iPhone()
                .environmentObject(AccountsDependencyResolver.shared)
                .eraseToAnyView()
        #else
            return Text("Main view").eraseToAnyView()
        #endif
    }
}
