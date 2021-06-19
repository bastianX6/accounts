//
//  View+Custom.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//
// Code from https://www.hackingwithswift.com/books/ios-swiftui/making-navigationview-work-in-landscape

import SwiftUI
import UIKit

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
