//
//  Float+Custom.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

public extension Float {
    /// String representation using currency number style
    var currencyString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
