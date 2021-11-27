//
//  ConsolidateWeatherModelTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/26/21.
//

import XCTest
@testable import MusalaSoftiOSTask
import CoreData
class ConsolidateWeatherModelTest: XCTestCase {
    
    
    var manager: TestCoreDataStack!
    override func setUpWithError() throws {
        manager = TestCoreDataStack()
        let data = loadStubFromBundle(withName: "day", extension: "json")
        let weathers = try! JSONDecoder().decode([ConsolidatedWeatherModel].self, from: data)
        _ = manager.createMangedObjectFromModel(consolidatedWeather: weathers)
        manager.saveContext()
        
    }

    override func tearDownWithError() throws {
       // sut = nil
    }

    func testInitFromNsManagedObject() {
       // let context =
        let expectation = expectation(description: "fetchvalue")
        
        let fetchRequest: NSFetchRequest<ConsolidatedWeather> = ConsolidatedWeather.fetchRequest()
        
        manager.container.viewContext.perform {
            do {
                let results = try fetchRequest.execute()
                //completion(results)
                XCTAssertTrue(results.count > 0)
                XCTAssertNotNil(results)
                let model = ConsolidatedWeatherModel(consolidatedWeather: results.first!)
                XCTAssertNotNil(model)
                XCTAssertTrue(model.weatherStateAbbr?.isEmpty == false)
                expectation.fulfill()
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
        
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    
}
