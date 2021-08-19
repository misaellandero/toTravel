//
//  ContentView.swift
//  Shared
//
//  Created by Misael Landero on 18/08/21.
//

import SwiftUI
import CoreData

// MARK: - Navigation Options
enum SectionSelected {
    case travels, toDo, map, settings
}
 
struct ContentView: View {
    
    // MARK: - Screen Size for determining ipad or iphone screen
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    
    // MARK: - current section selected
    @State var sectionSelected : SectionSelected? = .travels
    
    var body: some View {
        Group{
            #if os(iOS)
            if horizontalSizeClass == .compact {
                TabBarView()
            } else {
                SideBarView(sectionSelected : $sectionSelected)
            }
            #elseif os(macOS)
            //Text("hi test")
            SideBarView(sectionSelected : $sectionSelected)
            #endif
        }

    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
