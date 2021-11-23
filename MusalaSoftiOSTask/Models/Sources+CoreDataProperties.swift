//
//  Sources+CoreDataProperties.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//
//

import Foundation
import CoreData


extension Sources {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sources> {
        return NSFetchRequest<Sources>(entityName: "Sources")
    }

    @NSManaged public var tittle: String?
    @NSManaged public var slug: String?
    @NSManaged public var url: String?
    @NSManaged public var crawlRate: Int64

}

extension Sources : Identifiable {

}
