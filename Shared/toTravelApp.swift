//
//  toTravelApp.swift
//  Shared
//
//  Created by Misael Landero on 18/08/21.
//

import SwiftUI

@main
struct toTravelApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
