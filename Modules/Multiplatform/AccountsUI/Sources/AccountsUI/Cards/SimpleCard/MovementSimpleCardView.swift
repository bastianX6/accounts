//
//  MovementSimpleCardView.swift
//
//
//  Created by Bastián Véliz Vega on 15-09-20.
//

import Foundation
import SwiftUI

/**
 Movement simple card

 This view show an movement category or store in a simple way

 - Note:
 The view shows:
     - Movement title
     - Movement amount

 - Important:
 This view is compatible with accessibility size categories
 */
public struct MovementSimpleCardView: View {
    let model: MovementSimpleCardModel
    @Environment(\.sizeCategory) var sizeCategory

    /// Default initializer
    /// - Parameter model: model with movement information
    public init(model: MovementSimpleCardModel) {
        self.model = model
    }

    /// View's body
    public var body: some View {
        self.layout
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 3)
    }

    // MARK: - Layout

    private var layout: some View {
        #if os(watchOS)
            return self.accessibilityLayout.eraseToAnyView()
        #else
            if self.sizeCategory.isAccessibility {
                return self.accessibilityLayout.eraseToAnyView()
            } else {
                return self.regularLayout.eraseToAnyView()
            }
        #endif
    }

    private var regularLayout: some View {
        HStack {
            self.logo
            self.name
            self.amount
        }
    }

    private var accessibilityLayout: some View {
        VStack(alignment: .leading) {
            self.logo
            self.name
            self.amount
        }
    }

    // MARK: - View components

    private var image: some View {
        return Image.resizableImage(systemName: self.model.systemImageName)
    }

    private var logo: some View {
        self.image
            .scaledToFit()
            .frame(width: 40,
                   height: 30,
                   alignment: .leading)
            .foregroundColor(self.model.imageTintColor)
    }

    private var name: some View {
        Text(self.model.name)
            .font(.subheadline)
            .lineLimit(nil)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .layoutPriority(1)
    }

    private var amount: some View {
        let minWidth: CGFloat? = self.sizeCategory.isAccessibility ? nil : 110
        var alignment: Alignment = self.sizeCategory.isAccessibility ? .leading : .trailing

        #if os(watchOS)
            alignment = .leading
        #endif

        return Text(self.model.amount)
            .font(.headline)
            .frame(minWidth: minWidth,
                   alignment: alignment)
            .layoutPriority(2)
    }
}

struct MovementSimpleCardView_Previews: PreviewProvider {
    static var elements: [MovementSimpleCardModel] = [
        MovementSimpleCardModel(id: UUID(),
                                name: "Alimentos",
                                amount: "$ 9.999.999",
                                systemImageName: "cart.fill",
                                imageTintColor: .green),
        MovementSimpleCardModel(id: UUID(),
                                name: "Servicios básicos blah blah blah blah blah blah blah blah blah blah", amount: "$ 999",
                                systemImageName: "bolt.fill",
                                imageTintColor: .yellow),
        MovementSimpleCardModel(id: UUID(),
                                name: "Servicios online",
                                amount: "$ 9.999.999",
                                systemImageName: "tv.fill",
                                imageTintColor: .blue),
        MovementSimpleCardModel(id: UUID(),
                                name: "Otras compras",
                                amount: "$ 9",
                                systemImageName: "creditcard.fill",
                                imageTintColor: .red),
    ]

    static var previews: some View {
        Group {
            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    MovementSimpleCardView(model: element)
                }
            }

            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    MovementSimpleCardView(model: element)
                }
            }
            .environment(\.colorScheme, .dark)

            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    MovementSimpleCardView(model: element)
                }
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)

            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    MovementSimpleCardView(model: element)
                }
            }
            .environment(\.sizeCategory, .accessibilityLarge)
        }
    }
}
