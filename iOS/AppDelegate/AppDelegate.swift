//
//  AppDelegate.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 01-11-20.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    private var tasks: [UIApplicationDelegate]

    override init() {
        let firebaseTask = FirebaseTask()
        self.tasks = [
            firebaseTask
        ]
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        let initial: Bool? = nil
        let result = self.tasks.reduce(initial) { result, task in
            guard let taskResult = task.application?(application,
                                                     didFinishLaunchingWithOptions: launchOptions), result != nil
            else { return nil }
            return taskResult
        } ?? true

        return result
    }
}
