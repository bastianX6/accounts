//
//  FullBackgroundModifier.swift
//
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import Foundation
import SwiftUI

struct FullBackgroundModifier: ViewModifier {
    let color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)
            content
        }
    }
}
