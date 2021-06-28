//
//  WrapInNavigationViewModifier.swift
//
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
    import UIKit
#endif

struct WrapInNavigationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
            if UIDevice.current.userInterfaceIdiom == .phone {
                return NavigationView {
                    content
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .eraseToAnyView()
            } else {
                return content.eraseToAnyView()
            }
        #else
            return content.eraseToAnyView()
        #endif
    }
}
