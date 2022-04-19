//
//  WinemakerContact.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/18/22.
//
//

import Foundation
import CoreData

@objc(WinemakerContact)
public class WinemakerContact: NSManagedObject, Comparable {
    public static func < (lhs: WinemakerContact, rhs: WinemakerContact) -> Bool {
        return lhs.name! < rhs.name!
    }
}

extension WinemakerContact {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WinemakerContact> {
        return NSFetchRequest<WinemakerContact>(entityName: "WinemakerContact")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
}

extension WinemakerContact : Identifiable {}
