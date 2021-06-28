//
//  MovementListDataFake.swift
//
//
//  Created by Bastián Véliz Vega on 26-09-20.
//

import Foundation

#if DEBUG
import Previews
enum MovementListDataFake {
    static var summaryListDataModel: SummaryListView.DataModel {
        return SummaryListView.DataModel(month: "Mayo",
                                         year: "2019",
                                         elements: DataFake.simpleCardModelArray)
    }
}

#endif
