//
//  CurrencyTextField.swift
//
//
//  Created by Bastián Véliz Vega on 13-09-20.
//

import Combine
import Foundation
import SwiftUI

/// View composed by a Text and a Textfield with currency support
public struct CurrencyTextField: View {
    @Binding private var value: NSNumber

    let title: String
    let placeholder: String
    let formatter: NumberFormatter

    /// Default initializer
    /// - Parameters:
    ///   - title: view title
    ///   - placeholder: texfield's placeholder
    ///   - value: binding to textfield's value
    ///   - formatter:number formatter
    public init(title: String,
                placeholder: String,
                value: Binding<NSNumber>,
                formatter: NumberFormatter) {
        self.title = title
        self.placeholder = placeholder
        self.formatter = formatter
        self._value = value
    }

    /// View's body
    public var body: some View {
        VStack(alignment: .leading) {
            Text(self.title).bold()
            TextField(self.placeholder,
                      value: self.$value,
                      formatter: self.formatter)
        }
    }
}

struct CurrencyTextField_Previews: PreviewProvider {
    @ObservedObject static var viewModel = TestViewModel()
    static var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    static var previews: some View {
        Group {
            CurrencyTextField(title: "title", placeholder: "placeholder", value: self.$viewModel.amount, formatter: self.numberFormatter)
            Form {
                CurrencyTextField(title: "title", placeholder: "placeholder", value: self.$viewModel.amount, formatter: self.numberFormatter)
            }
        }
    }

    class TestViewModel: ObservableObject, Identifiable {
        let id = UUID()
        let objectWillChange = PassthroughSubject<TestViewModel, Never>()

        var amount: NSNumber = 0 {
            didSet {
                self.objectWillChange.send(self)
            }
        }
    }
}
