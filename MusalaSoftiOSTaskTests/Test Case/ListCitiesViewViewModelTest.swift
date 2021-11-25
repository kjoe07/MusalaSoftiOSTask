//
//  ListCitiesViewViewModelTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/23/21.
//

import XCTest
@testable import MusalaSoftiOSTask

class ListCitiesViewViewModelTest: XCTestCase {
    var sut: ListCitiesViewViewModel!

    override func setUpWithError() throws {
       let factory = ViewModelFactory()
        let manager = CoreDataManager()
        sut = ListCitiesViewViewModel(factory: factory, manager: manager)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testNumberOflocationsEquals3OrMore() {
        let expectation = expectation(description: "dataUpdated")
        sut.dataUpdated = { [weak self] in
            XCTAssertTrue(self!.sut.numberOfCities >= 3)
           // XCTAssertTrue(!(self!.sut.numberOfCities < 3))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testViewModelForIndexNotNilForAValidIndex() {
        let exp = expectation(description: "wait")
        sut.dataUpdated = { [weak self] in
            let number = Int.random(in: 0..<self!.sut.numberOfCities)
            let vm = self!.sut.viewModel(for:number)
            XCTAssertNotNil(vm)
            XCTAssertTrue(vm.locationName != "")
            XCTAssertTrue(vm.locationName.isEmpty == false)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3)        
    }
    
    

}
