//
//  ReadMovementsQuery+NSPredicate.swift
//
//
//  Created by Bastián Véliz Vega on 12-09-20.
//

import DataManagement
import Foundation

extension ReadMovementsQuery {
    var predicate: NSPredicate {
        var predicates: [NSPredicate] = []
        let idFormat = "%K == %@"

        if let storeId = self.storeId {
            let storePredicate = NSPredicate(format: idFormat, "storeId", storeId as CVarArg)
            predicates.append(storePredicate)
        }

        if let categoryId = self.categoryId {
            let categoryPredicate = NSPredicate(format: idFormat, "categoryId", categoryId as CVarArg)
            predicates.append(categoryPredicate)
        }

        if let paymentId = self.paymentId {
            let paymentPredicate = NSPredicate(format: idFormat, "paymentId", paymentId as CVarArg)
            predicates.append(paymentPredicate)
        }

        let startDatePredicate = NSPredicate(format: "date >= %@", self.fromDate as NSDate)
        let endDatePredicate = NSPredicate(format: "date < %@", self.toDate as NSDate)

        predicates.append(startDatePredicate)
        predicates.append(endDatePredicate)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        return compoundPredicate
    }
}
