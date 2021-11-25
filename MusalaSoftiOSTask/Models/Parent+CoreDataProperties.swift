//
//  Parent+CoreDataProperties.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//
//

import Foundation
import CoreData


extension Parent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Parent> {
        return NSFetchRequest<Parent>(entityName: "Parent")
    }

    @NSManaged public var title: String?
    @NSManaged public var locationType: String?
    @NSManaged public var woeid: Int64
    @NSManaged public var lattLong: String?

}

extension Parent : Identifiable {

}
