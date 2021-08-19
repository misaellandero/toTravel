//
//  TabbarNavigation.swift
//  toTravel
//
//  Created by Misael Landero on 19/08/21.
//

import SwiftUI
 

struct TabBarView: View {
    // MARK: - current section selected
    @State var sectionSelected = SectionSelected.travels
    
    var body: some View {
         
        TabView(selection: $sectionSelected){
            // MARK: - Travels
            NavigationView{
                Text("Travels")
            }
            .tabItem {
                Label("Travels", systemImage: "airplane")
            }
            .tag(SectionSelected.travels)
            // MARK: - toDo
            Text("ToDo")
                .tabItem {
                    Label("ToDo", systemImage: "checklist")
                }
                .tag(SectionSelected.travels)
            // MARK: - Map
            Text("Map")
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
                .tag(SectionSelected.map)
            // MARK: - Settings
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(SectionSelected.settings)
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView( )
    }
}
