//
//  ToDo+CoreDataProperties.swift
//  toTravel
//
//  Created by Misael Landero on 19/08/21.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var limitDate: Date?
    @NSManaged public var done: Bool
    @NSManaged public var notes: String?
    @NSManaged public var title: String?
    @NSManaged public var travel: Travel?
    
    // MARK: - Wrapped vars
    // Wrapped id
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    // Wrapped notes
    public var wrappedNotes: String {
        notes ?? "Sin notas"
    }
    
    // Wrapped title
    public var wrappedTitle: String {
        title ?? "Sin titulo"
    }
     
    // Wrapped dates
    public var wrappedLimitDate : Date {
        limitDate ?? Date()
    }
     
    // MARK: - Formated dates
    public var LimitDateFormated : String {
        //DateFormatter extension
        return DateFormatter.mediumDateTimeFormatter.string(from: wrappedLimitDate)
    }
    
    // MARK: - Computed properties
    
    //travelName
    public var contactName : String {
        return travel?.wrappedName ?? "Sin nombre"
    }
    
}

extension ToDo : Identifiable {

}
