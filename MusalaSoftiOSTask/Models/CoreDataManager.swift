//
//  CoreDataManager.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
import CoreData
import UIKit
class CoreDataManager {
    
    let locations = ["Sofia","NY", "Tokyo" ]
    let woid = [839722,2459115,1118370]
    
    init() {
        persistentContainer.loadPersistentStores { persistentStoreDescription, error in
            if let error = error {
                print("Unable to Add Persistent Store")
                print("\(error), \(error.localizedDescription)")
            } else {
                if UserDefaults.standard.value(forKey: "isNotFirstLaunch") == nil {
                    self.setInitialData()
                }
            }
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        NSPersistentContainer(name: "MusalaSoftiOSTask")
    }()
    
     func saveObject(){
        do {
            try persistentContainer.viewContext.save()
        
        } catch {
            print("Unable to Save, \(error)")
        }
    }
    func fetchLinks(completion: @escaping ([Location]) -> Void){
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        
        persistentContainer.viewContext.perform {
            do {
                let results = try fetchRequest.execute()
                completion(results)
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
    }
    func deleteAllConsolidatedWeather() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ConsolidatedWeather")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
           try persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: persistentContainer.viewContext)
        }catch {
            print(error)
        }        
    }
    
    func setInitialData() {
        for i in 0..<locations.count {
            let location = Location(context: persistentContainer.viewContext)
            location.woeid = woid[i] as NSNumber
            location.title = locations[i]
            do {
                try persistentContainer.viewContext.save()
                UserDefaults.standard.set(true, forKey: "isNotFirstLaunch")
                UserDefaults.standard.synchronize()
            
            } catch {
                print("Unable to Save, \(error)")
            }
        }
        
    }
}
