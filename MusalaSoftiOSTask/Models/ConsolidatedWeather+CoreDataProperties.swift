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
    @NSManaged public var minTemp: Double
    @NSManaged public var maxTemp: Double
    @NSManaged public var temp: Double
    @NSManaged public var windSpeed: Double
    @NSManaged public var windDirection: Double
    @NSManaged public var airPressure: NSObject?
    @NSManaged public var humidity: Int64
    @NSManaged public var visibility: Double
    @NSManaged public var predictability: Double

}

extension ConsolidatedWeather : Identifiable {

}
