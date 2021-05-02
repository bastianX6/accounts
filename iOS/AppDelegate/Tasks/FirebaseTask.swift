//
//  FirebaseTask.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 01-11-20.
//

import Firebase
import Foundation
import UIKit

class FirebaseTask: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
