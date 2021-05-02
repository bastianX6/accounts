//
//  GenericErrorView.swift
//
//
//  Created by Bastián Véliz Vega on 02-10-20.
//

import SwiftUI

/// Error view
public struct GenericErrorView: View {
    let error: Error?
    let title: String

    /// Default initializer
    /// - Parameters:
    ///   - title: view title
    ///   - error: error object
    public init(title: String, error: Error?) {
        self.title = title
        self.error = error
    }

    /// View's body
    public var body: some View {
        VStack {
            Image.resizableImage(systemName: "xmark.circle.fill")
                .scaledToFit()
                .frame(width: 200,
                       height: 200,
                       alignment: .leading)
                .foregroundColor(.red)
            Text(self.title)
                .bold()
            Text(self.error?.localizedDescription ?? "")
        }
    }
}

struct GenericErrorView_Previews: PreviewProvider {
    enum FakeError: Error {
        case fake
    }

    static var previews: some View {
        GenericErrorView(title: "View title", error: FakeError.fake)
    }
}
