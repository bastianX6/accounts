//
//  NavigationBarModifier.swift
//
//
//  Created by Bastián Véliz Vega on 02-10-20.
//

// Code from https://filipmolcik.com/navigationview-dynamic-background-color-in-swiftui/

import Foundation
import SwiftUI

#if !os(macOS)
    import UIKit
#endif

struct NavigationBarModifier: ViewModifier {
    let backgroundColor: Color
    let titleColor: Color

    init(backgroundColor: Color, titleColor: Color) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        #if os(iOS) || os(tvOS)
            let coloredAppearance = UINavigationBarAppearance()
            coloredAppearance.configureWithTransparentBackground()
            coloredAppearance.backgroundColor = UIColor(self.backgroundColor)
            coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(self.titleColor)]
            coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(self.titleColor)]

            UINavigationBar.appearance().standardAppearance = coloredAppearance
            UINavigationBar.appearance().compactAppearance = coloredAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            UINavigationBar.appearance().tintColor = .white
        #endif
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            #if os(iOS) || os(tvOS)
                VStack {
                    GeometryReader { geometry in
                        self.backgroundColor
                            .frame(height: geometry.safeAreaInsets.top)
                            .edgesIgnoringSafeArea(.top)
                        Spacer()
                    }
                }
            #endif
        }
    }
}
