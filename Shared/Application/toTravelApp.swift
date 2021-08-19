//
//  toTravelApp.swift
//  Shared
//
//  Created by Misael Landero on 18/08/21.
//

import SwiftUI

@main
struct toTravelApp: App {
    //Coreda Data
    @StateObject var coreData = PersistentCloudKitContainer()
    // User preference settings
    @StateObject var userPreferences = UserPreferences()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreData.persistentContainer.viewContext)
                .environmentObject(userPreferences)
        }
    }
}
