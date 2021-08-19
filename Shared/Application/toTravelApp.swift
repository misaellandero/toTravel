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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreData.persistentContainer.viewContext)
                //.environmentObject(userPreferences)
        }
    }
}
