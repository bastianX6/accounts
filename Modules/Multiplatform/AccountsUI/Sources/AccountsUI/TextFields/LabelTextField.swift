//
//  LabelTextField.swift
//
//
//  Created by Bastián Véliz Vega on 13-09-20.
//

import Combine
import Foundation
import SwiftUI

/// View composed by a Text and a TextField in a VStack
public struct LabelTextField: View {
    @Binding private var value: String
    let title: String
    let placeholder: String

    /// Default initializer
    /// - Parameters:
    ///   - title: view title
    ///   - placeholder: textfield's placeholder
    ///   - value: binding to textfield's value
    public init(title: String,
                placeholder: String,
                value: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        self._value = value
    }

    /// View body
    public var body: some View {
        VStack(alignment: .leading) {
            Text(self.title).bold()
            TextField(self.placeholder, text: self.$value)
        }
    }
}

struct LabelTextField_Previews: PreviewProvider {
    @ObservedObject static var viewModel = TestViewModel(value: "Holi")
    static var previews: some View {
        Group {
            LabelTextField(title: "Title", placeholder: "placeholder", value: self.$viewModel.value)
            Form {
                LabelTextField(title: "Title", placeholder: "placeholder", value: self.$viewModel.value)
            }
        }
    }

    class TestViewModel: ObservableObject, Identifiable {
        let id = UUID()
        let objectWillChange = PassthroughSubject<TestViewModel, Never>()

        init(value: String) {
            self.value = value
        }

        var value: String {
            didSet {
                self.objectWillChange.send(self)
            }
        }
    }
}
