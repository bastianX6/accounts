//
//  ListHeaderView.swift
//
//
//  Created by Bastián Véliz Vega on 15-09-20.
//

import SwiftUI

/// Header used in expenses list
/// - Note:
///   This view could be replaced by the native `Label` element
public struct ListHeaderView: View {
    let systemImageName: String
    let imageColor: Color
    let title: String

    /// Default initializer
    /// - Parameters:
    ///   - systemImageName: system image name (using SF symbols)
    ///   - imageColor: image tint color
    ///   - title: header title
    public init(systemImageName: String,
                imageColor: Color,
                title: String) {
        self.systemImageName = systemImageName
        self.imageColor = imageColor
        self.title = title
    }

    /// View's body
    public var body: some View {
        HStack {
            self.image
                .scaledToFit()
                .frame(width: self.imageSize,
                       height: self.imageSize,
                       alignment: .leading)
                .foregroundColor(self.imageColor)
            Text(self.title)
                .font(.title)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var image: some View {
        return Image.resizableImage(systemName: self.systemImageName)
    }

    private var imageSize: CGFloat {
        var width: CGFloat = 26
        #if os(tvOS)
            width = 52
        #endif
        return width
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListHeaderView(systemImageName: "dollarsign.circle.fill",
                           imageColor: .green,
                           title: "This is a tittle")

            ListHeaderView(systemImageName: "dollarsign.circle.fill",
                           imageColor: .green,
                           title: "This is a tittle")
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}
