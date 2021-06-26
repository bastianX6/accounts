//
//  MovementsDetailsDataFake.swift
//
//
//  Created by Bastián Véliz Vega on 26-09-20.
//

import Foundation

#if DEBUG
import Previews
enum MovementsDetailsDataFake {
    // MARK: - Simple card model previews

    static var movementDetailsViewModel: MovementDetailsViewModel {
        return MovementDetailsViewModel(dataModel: DataFake.dataModel)
    }
}
#endif
