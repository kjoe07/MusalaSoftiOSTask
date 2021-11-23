//
//  CoreDataManager.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
import CoreData
class CoreDataManager {
    
    init() {
        persistentContainer.loadPersistentStores { persistentStoreDescription, error in
            if let error = error {
                print("Unable to Add Persistent Store")
                print("\(error), \(error.localizedDescription)")
            } else {
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
}
