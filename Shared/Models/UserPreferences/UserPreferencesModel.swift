//
//  UserPreferencesModel.swift
//  toTravel
//
//  Created by Misael Landero on 19/08/21.
//

import Foundation
struct UserPreferencesModel : Identifiable, Codable {
    var id = UUID()
    //Accent Color
    var accentColor = 0
    //Alternative App Icon
    var appIcon = 0
}
