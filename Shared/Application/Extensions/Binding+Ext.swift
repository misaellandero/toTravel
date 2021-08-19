//
//  Binding+Ext.swift
//  toTravel
//
//  Created by Misael Landero on 19/08/21.
//
 
import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
