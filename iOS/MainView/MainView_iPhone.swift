//
//  MainView_iPhone.swift
//  Accounts
//
//  Created by Bastián Véliz Vega on 06-10-20.
//

import SwiftUI
import UIKit

struct MainView_iPhone: View {
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            AccountNavigationView()
        } else {
            AccountTabView()
        }
    }
}

struct MainView_iPhone_Previews: PreviewProvider {
    static var previews: some View {
        MainView_iPhone()
    }
}
