//
//  AccountsDependencyResolver.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 09-10-20.
//

import AccountsUI
import DataManagement
import DependencyResolver
import Foundation

class AccountsDependencyResolver: DependencyResolverProtocol {
    static let shared: some DependencyResolverProtocol = AccountsDependencyResolver()

    private let resolver: some DependencyResolverProtocol = {
        DependencyResolver(bundle: Bundle.main)
    }()

    var appearance: Appearance {
        self.resolver.appearance
    }

    func setDataSourceAvailability<T>(_ availability: DataSourceAvailability, forType type: T.Type) {
        self.resolver.setDataSourceAvailability(availability, forType: type)
    }

    func setResourcesAvailability<T>(_ availability: ResourcesAvailability, forType type: T.Type) {
        self.resolver.setResourcesAvailability(availability, forType: type)
    }

    func getDataSourceRead<T>(forType type: T.Type) throws -> DataSourceRead {
        try self.resolver.getDataSourceRead(forType: type)
    }

    func getDataSourceModify<T>(forType type: T.Type) throws -> DataSourceModify {
        try self.resolver.getDataSourceModify(forType: type)
    }

    func getIncomeResources<T>(forType type: T.Type) throws -> MovementResources {
        try self.resolver.getIncomeResources(forType: type)
    }

    func getExpeditureResources<T>(forType type: T.Type) throws -> MovementResources {
        try self.resolver.getExpeditureResources(forType: type)
    }
}
