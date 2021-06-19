//
//  LabelSwitchView.swift
//
//
//  Created by Bastián Véliz Vega on 13-09-20.
//

import Combine
import Foundation
import SwiftUI

/// View composed by a Text and a Toggle
public struct LabelSwitchView: View {
    @Binding private var isOn: Bool
    let title: String

    /// Default initializer
    /// - Parameters:
    ///   - title: view title
    ///   - isOn: Binding to isOn toggle property
    public init(title: String,
                isOn: Binding<Bool>) {
        self.title = title
        self._isOn = isOn
    }

    /// View's body
    public var body: some View {
        Toggle(isOn: self.$isOn) {
            Text(self.title).bold()
        }
    }
}

struct LabelSwitchView_Previews: PreviewProvider {
    @ObservedObject static var viewModel = TestViewModel(isOn: true)
    @ObservedObject static var viewModel2 = TestViewModel(isOn: false)
    static var previews: some View {
        Group {
            LabelSwitchView(title: "Title", isOn: self.$viewModel.isOn)
            Form {
                LabelSwitchView(title: "Title", isOn: self.$viewModel.isOn)
                LabelSwitchView(title: "Title", isOn: self.$viewModel2.isOn)
            }
        }
    }

    class TestViewModel: ObservableObject, Identifiable {
        let id = UUID()
        let objectWillChange = PassthroughSubject<TestViewModel, Never>()

        init(isOn: Bool) {
            self.isOn = isOn
        }

        var isOn: Bool {
            didSet {
                self.objectWillChange.send(self)
            }
        }
    }
}
