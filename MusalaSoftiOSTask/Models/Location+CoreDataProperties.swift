//
//  Location+CoreDataProperties.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var title: String?
    @NSManaged public var locationType: String?
    @NSManaged public var woeid: NSNumber
    @NSManaged public var lattLong: String?
    @NSManaged public var timeZone: String?
    @NSManaged public var sources: Set<Sources>?
    @NSManaged public var consolidateWeather: NSOrderedSet?
    @NSManaged public var time: String?
    @NSManaged public var sunRise: String?
    @NSManaged public var sunSet: String?
    @NSManaged public var timeZoneName: String?
    @NSManaged public var parent: Parent?

}

// MARK: Generated accessors for sources
extension Location {

    @objc(addSourcesObject:)
    @NSManaged public func addToSources(_ value: Sources)

    @objc(removeSourcesObject:)
    @NSManaged public func removeFromSources(_ value: Sources)

    @objc(addSources:)
    @NSManaged public func addToSources(_ values: NSSet)

    @objc(removeSources:)
    @NSManaged public func removeFromSources(_ values: NSSet)

}

// MARK: Generated accessors for consolidateWeather
extension Location {

    @objc(addConsolidateWeatherObject:)
    @NSManaged public func addToConsolidateWeather(_ value: ConsolidatedWeather)

    @objc(removeConsolidateWeatherObject:)
    @NSManaged public func removeFromConsolidateWeather(_ value: ConsolidatedWeather)

    @objc(addConsolidateWeather:)
    @NSManaged public func addToConsolidateWeather(_ values: NSSet)

    @objc(removeConsolidateWeather:)
    @NSManaged public func removeFromConsolidateWeather(_ values: NSSet)

}

extension Location : Identifiable {

}

