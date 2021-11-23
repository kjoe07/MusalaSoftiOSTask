//
//  AppDelegateTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/22/21.
//

import XCTest
import CoreData
import MusalaSoftiOSTask

class AppDelegateTest: XCTestCase {
    
//    private lazy var persistentContainer: NSPersistentContainer = {
//        NSPersistentContainer(name: "MusalaSoftiOSTask")
//    }()
//    let fetchRequest: NSFetchRequest<Location> =  Location.fetchRequest()
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        fetchLocations()
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        UserDefaults.standard.removeObject(forKey: "isNotFirstLaunch")
//    }
//
//    func testCoreDataInitialInstallLocationCountsequeal3() {
////        persistentContainer.viewContext.perform { [weak self] in
////            guard let self = self else {return}
////            do {
////                print("fetch done")
////                let results = try self.fetchRequest.execute()
////                XCTAssertEqual(results.count, 3)
////                XCTAssertEqual(results.first?.title, "Sofia")
////                XCTAssertEqual(results.first?.woeid, 839722)
////            } catch {
////                print("Unable to Execute Fetch Request, \(error)")
////            }
////        }
//    }
//    
//    func testnotFirstRunLocationsCountsEquals3(){
////        UserDefaults.standard.set(true, forKey: "isNotFirstLaunch")
////        persistentContainer.viewContext.perform { [weak self] in
////            guard let self = self else {return}
////            do {
////                print("fetch done")
////                let results = try self.fetchRequest.execute()
////                XCTAssertEqual(results.count, 3)
////                
////            } catch {
////                print("Unable to Execute Fetch Request, \(error)")
////               // XCTAssertThrowsError(error)
////            }
////        }
//    }
//   
//
//    
//    private func fetchLocations() {
//        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
//        
//        persistentContainer.viewContext.perform {
//            do {
//                print("fetch done")
//                _ = try fetchRequest.execute()
//            } catch {
//                print("Unable to Execute Fetch Request, \(error)")
//            }
//        }
//    }
}
