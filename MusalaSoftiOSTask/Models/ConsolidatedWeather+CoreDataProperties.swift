//
//  ConsolidatedWeather+CoreDataProperties.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//
//

import Foundation
import CoreData


extension ConsolidatedWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ConsolidatedWeather> {
        return NSFetchRequest<ConsolidatedWeather>(entityName: "ConsolidatedWeather")
    }

    @NSManaged public var id: Int64
    @NSManaged public var weatherStateName: String?
    @NSManaged public var weatherStateAbbr: String?
    @NSManaged public var windDirectionCompass: String?
    @NSManaged public var created: String?
    @NSManaged public var applicableDate: NSObject?
    @NSManaged public var minTemp: NSNumber
    @NSManaged public var maxTemp: NSNumber
    @NSManaged public var temp: NSNumber
    @NSManaged public var windSpeed: NSNumber
    @NSManaged public var windDirection: NSNumber
    @NSManaged public var airPressure: NSObject?
    @NSManaged public var humidity: NSNumber
    @NSManaged public var visibility: NSNumber
    @NSManaged public var predictability: NSNumber

}

extension ConsolidatedWeather : Identifiable {

}
