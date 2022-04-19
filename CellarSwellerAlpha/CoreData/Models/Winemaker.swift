//
//  Winemaker.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/18/22.
//

import Foundation
import CoreData

public class Winemaker: NSManagedObject, Comparable {
    public static func < (lhs: Winemaker, rhs: Winemaker) -> Bool {
        return lhs.name! < rhs.name!
    }
}

extension Winemaker {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Winemaker> {
        return NSFetchRequest<Winemaker>(entityName: "Winemaker")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var contacts: Set<WinemakerContact>
}

extension Winemaker : Identifiable {}
