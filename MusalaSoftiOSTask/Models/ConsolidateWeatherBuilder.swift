//
//  ConsolidateWeatherBuilder.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/24/21.
//

import Foundation
class ConsolidateWeatherBuilder {    
    
    
    static func createConsolidateWeather(location: ResponseWoeid, manager: CoreDataManager) -> NSOrderedSet {
        let model = NSMutableOrderedSet()
        
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
            model.add(consolidate)
        }
        return model
    }
    
    static func createReponseWoeidFromNSManagedObject(location: Location, model: ResponseWoeid, manager: CoreDataManager) {
        let consolidatedWeather = ConsolidateWeatherBuilder.createConsolidateWeather(location: model, manager: manager)
        for weather in location.consolidateWeather ?? []{
            manager.persistentContainer.viewContext.delete(weather as! ConsolidatedWeather)
        }
        //manager.deleteAllConsolidatedWeather()
        location.consolidateWeather = nil
        location.consolidateWeather = consolidatedWeather
        if let parent = model.parent {
            let parent = ConsolidateWeatherBuilder.createParen(parent: parent, manager: manager)
            location.parent = parent
        }
        location.sunRise = model.sunRise
        location.sunSet = model.sunSet
        location.timeZoneName = model.timezoneName
        location.time = model.time
        location.timeZone = model.timezone
        location.locationType = model.locationType
        var sour = Set<Sources>()
        for sourc in model.sources ?? [] {
            let source = Sources(context: manager.persistentContainer.viewContext)
            source.crawlRate = sourc.crawlRate as NSNumber?
            source.slug = sourc.slug
            source.tittle = sourc.title
            source.url = sourc.url
            sour.insert(source)
        }
        location.sources = sour
    }
    
    static func createParen(parent: ParentModel, manager: CoreDataManager) -> Parent{
        let coreDataModel = Parent(context: manager.persistentContainer.viewContext)
        coreDataModel.woeid = Int64(parent.woeid ?? 0)
        coreDataModel.lattLong = parent.lattLong
        coreDataModel.locationType = parent.locationType
        coreDataModel.title = parent.title
        return coreDataModel
    }
    static func createLocationFromResponseWoeidModel(model: ResponseWoeid, manager: CoreDataManager) {
        let location = Location(context: manager.persistentContainer.viewContext)
        location.consolidateWeather = nil
        location.title = model.title
        location.locationType = model.locationType
        location.woeid = (model.woeid ?? 0) as NSNumber
        location.lattLong = model.lattLong
        manager.saveObject()
    }
}
