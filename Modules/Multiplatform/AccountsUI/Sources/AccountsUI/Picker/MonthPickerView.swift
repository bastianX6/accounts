//
//  MonthPickerView.swift
//
//
//  Created by Bastián Véliz Vega on 13-09-20.
//

import Combine
import Foundation
import SwiftUI

/// Picker with a list of months
public struct MonthPickerView: View {
    let title: String
    let locale: Locale
    let showTitle: Bool
    @Binding private var selection: Int

    var elements: [PickerElement<Int, String>] {
        var array = [PickerElement<Int, String>]()
        for index in 0 ..< self.months.count {
            array.append(PickerElement<Int, String>(id: index + 1, element: self.months[index]))
        }

        return array
    }

    var months: [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = self.locale

        guard let months = dateFormatter.monthSymbols else {
            fatalError("Couldn't get months")
        }

        return months
    }

    /// Default initializer
    /// - Parameters:
    ///   - title: View title
    ///   - selection: Binding to picker selected index
    ///   - locale: Locale used to get month symbols from date formater. Default Value: Locale.current
    ///   - showTitle: Show title label
    public init(title: String,
                selection: Binding<Int>,
                locale: Locale = Locale.current,
                showTitle: Bool = true)
    {
        self.title = title
        self.locale = locale
        self._selection = selection
        self.showTitle = showTitle
    }

    /**
     View body

     View with a label and a picker with months

      - Note:
      This view uses an instance of `LabelPickerView` internally

     */
    public var body: some View {
        LabelPickerView(title: self.title,
                        elements: self.elements,
                        selection: self.$selection,
                        showTitle: self.showTitle)
    }
}

struct MonthPickerView_Previews: PreviewProvider {
    @ObservedObject static var viewModel = TestViewModel()

    static var previews: some View {
        Group {
            MonthPickerView(title: "Meses", selection: self.$viewModel.selection)
            MonthPickerView(title: "Meses", selection: self.$viewModel.selection, locale: Locale(identifier: "en_US"))
        }
    }

    class TestViewModel: ObservableObject, Identifiable {
        let id = UUID()
        let objectWillChange = PassthroughSubject<TestViewModel, Never>()

        var selection: Int = 0 {
            didSet {
                self.objectWillChange.send(self)
            }
        }
    }
}
