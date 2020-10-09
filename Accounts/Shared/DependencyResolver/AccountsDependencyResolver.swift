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

enum AccountsDependencyResolver {
    static let shared: some DependencyResolverProtocol = DependencyResolver(bundle: Bundle.main)
}
