//
//  DateSelector.swift
//
//
//  Created by Bastián Véliz Vega on 13-09-20.
//

import Combine
import Foundation
import SwiftUI

/// DatePicker decorator view
@available(watchOS,
           unavailable,
           message: "DateSelector is not available in watchOS")
@available(tvOS,
           unavailable,
           message: "DateSelector is not available in tvOS")
public struct DateSelector: View {
    @Binding private var date: Date
    let title: String
    let dateFormatter: DateFormatter
    let components: DatePickerComponents

    /// Default initializer
    /// - Parameters:
    ///   - title: view title
    ///   - date: binding to date property
    ///   - formatter: date formarter. Default value: `nil`
    ///   - components: date components. Default value: `.date`
    public init(title: String,
                date: Binding<Date>,
                formatter: DateFormatter? = nil,
                components: DatePickerComponents = .date) {
        self.title = title
        self.components = components
        if let formatter = formatter {
            self.dateFormatter = formatter
        } else {
            self.dateFormatter = DateFormatter()
            self.dateFormatter.dateStyle = .medium
        }
        self._date = date
    }

    /// View's body
    public var body: some View {
        VStack(alignment: .leading) {
            DatePicker(self.title,
                       selection: $date,
                       displayedComponents: self.components)
        }
    }
}

@available(watchOS,
           unavailable,
           message: "DateSelector is not available in watchOS")
@available(tvOS,
           unavailable,
           message: "DateSelector is not available in tvOS")
struct DateSelector_Previews: PreviewProvider {
    @ObservedObject static var viewModel = TestViewModel()
    static var previews: some View {
        Group {
            DateSelector(title: "Date", date: self.$viewModel.date)
            Form {
                DateSelector(title: "Date", date: self.$viewModel.date)
                DateSelector(title: "Time", date: self.$viewModel.date, components: .hourAndMinute)
                DateSelector(title: "All", date: self.$viewModel.date, components: [.date, .hourAndMinute])
            }
        }
    }

    class TestViewModel: ObservableObject, Identifiable {
        let id = UUID()
        let objectWillChange = PassthroughSubject<TestViewModel, Never>()

        var date: Date = Date() {
            didSet {
                self.objectWillChange.send(self)
            }
        }
    }
}
