//
//  Travel+CoreDataProperties.swift
//  toTravel
//
//  Created by Misael Landero on 19/08/21.
//
//

import Foundation
import CoreData
import SwiftUI

extension Travel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Travel> {
        return NSFetchRequest<Travel>(entityName: "Travel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var creationDate: Date?
    @NSManaged public var travelDate: Date?
    @NSManaged public var toDos: NSSet?
    
    
    // MARK: - Wrapped vars
    
    // Wrapped id
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    // Wrapped name
    public var wrappedName: String {
        name ?? "Viaje sin nombre"
    }
    
    // Wrapped image
    public var wrappedImage: Image {
        
        if let imageConverted = UIImage(data: image!){
            
            return Image(uiImage: imageConverted)
        }
        
            return Image("travelPlaceHolder")
    }
     
    // Wrapped dates
    public var wrappedCreationDate : Date {
        creationDate ?? Date()
    }
    public var wrappedTravelDate : Date {
        travelDate ?? Date()
    }
    
    // MARK: - Formated Dates
    
    public var CreationDateFormated : String {
        //DateFormatter extension
        return DateFormatter.mediumDateTimeFormatter.string(from: wrappedCreationDate)
    }
     
    public var TravelDateFormated : String {
        //DateFormatter extension
        return DateFormatter.mediumDateTimeFormatter.string(from: wrappedTravelDate)
    }
    
    
    // MARK: - Array toDos
    public var toDosArray: [ToDo] {
        let set = toDos as? Set<ToDo> ?? []
        
        return set.sorted {
            $0.wrappedLimitDate > $1.wrappedLimitDate
        }
    }
    
    // MARK: - Days to travel
    
    public var daysLeftTo : Int {
        let components = Calendar.current.dateComponents([.day], from: wrappedTravelDate, to: Date())
        return components.day ?? 0
    }
    

}

// MARK: Generated accessors for toDos
extension Travel {

    @objc(addToDosObject:)
    @NSManaged public func addToToDos(_ value: ToDo)

    @objc(removeToDosObject:)
    @NSManaged public func removeFromToDos(_ value: ToDo)

    @objc(addToDos:)
    @NSManaged public func addToToDos(_ values: NSSet)

    @objc(removeToDos:)
    @NSManaged public func removeFromToDos(_ values: NSSet)

}

extension Travel : Identifiable {

}
