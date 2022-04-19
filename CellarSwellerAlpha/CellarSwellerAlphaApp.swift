//
//  CellarSwellerAlphaApp.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/18/22.
//

import SwiftUI

@main
struct CellarSwellerAlphaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
