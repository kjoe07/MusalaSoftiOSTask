//
//  ConsolidateWeatherBuilder.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/24/21.
//

import Foundation
class ConsolidateWeatherBuilder {
    
    
    
    static func createConsolidateWeather(location: ResponseWoeid, manager: CoreDataManager) -> Set<ConsolidatedWeather> {
        var model = Set<ConsolidatedWeather>()
        
        for  weather in location.consolidatedWeather ?? [] {
            let consolidate = ConsolidatedWeather(context: manager.persistentContainer.viewContext)
            consolidate.id = (weather.id ?? 0) as NSNumber
            consolidate.weatherStateName = weather.weatherStateName
            consolidate.weatherStateAbbr = weather.weatherStateAbbr
            consolidate.windDirectionCompass = weather.windDirectionCompass
            consolidate.created = weather.created
            consolidate.applicableDate = weather.applicableDate
            consolidate.minTemp = weather.minTemp as NSNumber?
            consolidate.maxTemp = weather.maxTemp as NSNumber?
            consolidate.temp = weather.theTemp as NSNumber?
            consolidate.windSpeed = weather.windSpeed as NSNumber?
            consolidate.windDirection = weather.windDirection as NSNumber?
            consolidate.airPressure = weather.airPressure as NSNumber?
            consolidate.humidity = weather.humidity as NSNumber?
            consolidate.visibility = weather.visibility as NSNumber?
            consolidate.predictability = weather.predictability as NSNumber?
            model.insert(consolidate)
        }
        return model
    }
    
    static func createReponseWoeidFromNSManagedObject() {
        
    }
    
    
}
