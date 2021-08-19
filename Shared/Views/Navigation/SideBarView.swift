//
//  SidebarNavigation.swift
//  toTravel
//
//  Created by Misael Landero on 19/08/21.
//

import SwiftUI

struct SideBarView: View {
    // MARK: - current section selected
    @Binding var sectionSelected : SectionSelected?
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Travels"), tag: SectionSelected.travels, selection: $sectionSelected) {
                    Label("Travels", systemImage: "airplane")
                }
                
                NavigationLink(destination: Text("ToDo"), tag: SectionSelected.toDo, selection: $sectionSelected) {
                    Label("ToDo", systemImage: "checklist")
                }
                
                NavigationLink(destination: Text("Map"), tag: SectionSelected.map, selection: $sectionSelected) {
                    Label("Map", systemImage: "map.fill")
                }
                
                NavigationLink(destination: Text("Settings"), tag: SectionSelected.settings, selection: $sectionSelected) {
                    Label("Settings", systemImage: "gear")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 250, idealWidth: 250, maxWidth: 350)
            .toolbar{
                #if os(macOS)
                //Toggle Sidebar Button
                ToolbarItem(placement: .navigation){
                    
                    Text("\(Image(systemName: "sidebar.left"))")
                         .font(Font.system(.title, design: .rounded).weight(.bold))
                        .onTapGesture {
                            toggleSidebar()
                        }
                }
                #endif
            }
            .navigationTitle("ToTravel")
            
            Text("Detail view")
            #if  os(macOS)
            Text("Detail view")
            #endif
           
            //.navigationTitle("DebtMe")
        }
    }
    
    // Toggle Sidebar Function
    func toggleSidebar() {
        #if os(macOS)
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(sectionSelected: .constant(.toDo))
    }
}
