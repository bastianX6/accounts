//
//  MovementsDetailsDataFake.swift
//
//
//  Created by Bastián Véliz Vega on 26-09-20.
//

#if DEBUG
import Foundation
import MovementList
import Previews

enum MovementsDetailsDataFake {
    static var movementDetailsViewModel: MovementDetailsViewModel {
        return MovementDetailsViewModel(dataModel: DataFake.dataModel)
    }

    static var movementDetailsModel: MovementDetailsModel {
        return MovementDetailsMapper.getModel(from: DataFake.movements,
                                              icon: "creditcard.fill",
                                              tintColor: .indigo)
    }
}
#endif
