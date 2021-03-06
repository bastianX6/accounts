//
//  MovementTypeSelectorView.swift
//
//
//  Created by Bastián Véliz Vega on 17-10-20.
//

import DataManagement
import NewMovement
import SwiftUI

/// New movement type selector view
public struct MovementTypeSelectorView: View {
    private var dataModel: NewMovementViewDataModel

    /// Default initializer
    /// - Parameters:
    ///   - dataModel: data used to populate the view
    public init(dataModel: NewMovementViewDataModel) {
        self.dataModel = dataModel
    }

    /// View's body
    public var body: some View {
        return MovementTypeSelectorInternalView(dataModel: self.dataModel)
    }
}

#if DEBUG
import Previews
import NewMovementPreview

struct MovementTypeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MovementTypeSelectorView(dataModel: NewMovementDataFake.dataModel)
    }
}
#endif
