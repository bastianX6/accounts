//
//  MovementDetailCardView.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import SwiftUI

/**
 Movement detail card

 This view show an movement in detail

 - Note:
 The view shows:
     - Movement title
     - Movement description
     - Movement amount
     - Multi-payment info if exists

 - Important:
 This view is compatible with accessibility size categories
 */
public struct MovementDetailCardView: View {
    @Environment(\.sizeCategory) var sizeCategory

    let model: MovementDetailCardModel

    /// Default initializer
    /// - Parameter model: model with movement information
    public init(model: MovementDetailCardModel) {
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

    private var layout: some View {
        #if os(watchOS)
            return self.accessibilityLayout.eraseToAnyView()
        #else
            if self.sizeCategory.isAccessibility {
                return self.accessibilityLayout.eraseToAnyView()
            } else {
                return self.defaultLayout.eraseToAnyView()
            }
        #endif
    }

    // MARK: - Layout

    private var defaultLayout: some View {
        VStack {
            HStack {
                self.logo
                self.title
                self.amount
            }
            HStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 40,
                           height: 1,
                           alignment: .leading)
                self.description
                self.multiPaymentText
            }
        }
    }

    private var accessibilityLayout: some View {
        VStack(alignment: .leading) {
            self.logo
            self.title
            self.description
            self.amount
            self.multiPaymentText
        }
    }

    // MARK: - Components

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

    private var title: some View {
        Text(self.model.title)
            .font(.subheadline)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .layoutPriority(1)
    }

    private var description: some View {
        Text(self.model.description)
            .font(.subheadline)
            .foregroundColor(Color.systemGray)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .layoutPriority(1)
    }

    private var multiPaymentText: some View {
        let paymentString = self.model.paymentInfo?.paymentString ?? ""
        let minWidth: CGFloat? = self.sizeCategory.isAccessibility ? nil : 110
        var alignment: Alignment = self.sizeCategory.isAccessibility ? .leading : .trailing

        #if os(watchOS)
            alignment = .leading
        #endif

        return Text(paymentString)
            .font(.subheadline)
            .foregroundColor(Color.red)
            .frame(minWidth: minWidth,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: alignment)
            .layoutPriority(2)
    }

    private var amount: some View {
        let minWidth: CGFloat? = self.sizeCategory.isAccessibility ? nil : 110
        var alignment: Alignment = self.sizeCategory.isAccessibility ? .leading : .trailing

        #if os(watchOS)
            alignment = .leading
        #endif

        return Text(self.model.amount)
            .font(.headline)
            .lineLimit(nil)
            .frame(minWidth: minWidth,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: alignment)
            .layoutPriority(2)
    }
}

struct MovementDetailCardView_Previews: PreviewProvider {
    static let model: MovementDetailCardModel = {
        let model = MovementDetailCardModel(id: UUID(),
                                              systemImageName: "creditcard.fill",
                                              imageTintColor: .indigoLegacy,
                                              title: "Esto es un texto de dos líneas blah blah blah blah",
                                              description: "Esta es una breve descripción del movimiento",
                                              amount: "$9.999.999")
        return model
    }()

    static let modelWithPayments: MovementDetailCardModel = {
        let payment = MovementDetailCardModel.Payments(current: 99, total: 99, title: "Cuota")
        let model = MovementDetailCardModel(id: UUID(),
                                              systemImageName: "creditcard.fill",
                                              imageTintColor: .indigoLegacy,
                                              title: "Esto es un texto de dos líneas",
                                              description: "Esta es una breve descripción del movimiento",
                                              amount: "$9.999.999",
                                              paymentInfo: payment)
        return model
    }()

    static var previews: some View {
        Group {
            ScrollView {
                MovementDetailCardView(model: self.modelWithPayments)
                MovementDetailCardView(model: self.model)
            }.background(Color.systemGray6)
                .environment(\.colorScheme, .light)

            ScrollView {
                MovementDetailCardView(model: self.modelWithPayments)
                MovementDetailCardView(model: self.model)
            }
            .environment(\.colorScheme, .dark)

            ScrollView {
                MovementDetailCardView(model: self.modelWithPayments)
                MovementDetailCardView(model: self.model)
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .environment(\.colorScheme, .light)

            ScrollView {
                MovementDetailCardView(model: self.modelWithPayments)
                MovementDetailCardView(model: self.model)
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .environment(\.colorScheme, .dark)
        }
    }
}
