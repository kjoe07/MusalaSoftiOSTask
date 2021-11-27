//
//  CoreDataStack.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/26/21.
//

import Foundation
import CoreData
@testable import MusalaSoftiOSTask
class TestCoreDataStack {
    
    public static let model: NSManagedObjectModel = {
      let modelURL = Bundle.main.url(forResource: "MusalaSoftiOSTask", withExtension: "momd")!
      return NSManagedObjectModel(contentsOf: modelURL)!
    }()
  
    init() {
        
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(
            name: "MusalaSoftiOSTask",
            managedObjectModel: TestCoreDataStack.model)
        container.persistentStoreDescriptions = [persistentStoreDescription]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        self.container = container
    }
    var container: NSPersistentContainer!
    
    func createMangedObjectFromModel(consolidatedWeather: [ConsolidatedWeatherModel]) -> NSOrderedSet {
        let model = NSMutableOrderedSet()
        
        for  weather in consolidatedWeather {
            let consolidate = ConsolidatedWeather(context: self.container.viewContext)
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
        print("model to save:", model.count)
        return model
    }
    
    func saveContext() {
        do {
            try container.viewContext.save()
        }catch {
            print(error.localizedDescription)
        }
    }
}
