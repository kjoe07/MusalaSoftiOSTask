//
//  LocationService.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
import CoreData
class RemoteDataService:Services{
    let loader: DataLoader
    let endpoint: Endpoint
    func getData<T: Codable>( completion: @escaping (Result<T,Error>) -> Void) {
        let r = try! endpoint.urlRequest()
        loader.loadData(request: r, completion: {result in
            switch result{
            case .success(let d):
                do{
                    let resp = try JSONDecoder().decode(T.self, from: d)
                    completion(.success(resp))
                }catch {
                    completion(.failure(error))
                }
            case .failure(let e):
                completion(.failure(e))
            }
        })
    }
    
    init(loader: DataLoader, endpoint: Endpoint) {
        self.loader = loader
        self.endpoint = endpoint
    }
}
class LocalDataService: Services{
    let dbManager: CoreDataManager
    
    init(dbManager: CoreDataManager) {
        self.dbManager = dbManager
    }
    
    func getData<T: Codable>( completion: @escaping (Result<T, Error>) -> Void) {
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        
        dbManager.persistentContainer.viewContext.perform {
            do {
                let results = try fetchRequest.execute()
                completion(.success(results as! T))
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
        
    }
}
