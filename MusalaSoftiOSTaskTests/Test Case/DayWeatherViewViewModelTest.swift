//
//  DayWeatherViewViewModelTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/24/21.
//

import XCTest
@testable import MusalaSoftiOSTask
class DayWeatherViewViewModelTest: XCTestCase {
    var sut: DayWeatherViewViewModel!
    
    override func setUpWithError() throws {
        sut = DayWeatherViewViewModel(date: "2021-11-26",woeid:44865 ,service: FakeService())
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testTitle() {
        XCTAssertNotNil(sut.title)
        XCTAssertTrue(sut.title != "")
        XCTAssertTrue(sut.title.isEmpty == false)
        
    }
    
    func testDataLoad() {
        let exp = expectation(description: "dataload")
        sut.service.getData(completion: { (result: Result<[ConsolidatedWeatherModel],Error>) in
            switch result {
            case .success(let success):
                XCTAssertTrue(success.count > 0)
                XCTAssertNotNil(success)
                self.sut.weathers = success
                XCTAssertTrue(self.sut.numberOfDays == success.count)
                exp.fulfill()
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        })
        wait(for:[exp], timeout: 2)
    }

    func testViewForIndex() {
        let data = loadStubFromBundle(withName: "day", extension: "json")
        let weather = try! JSONDecoder().decode([ConsolidatedWeatherModel].self, from: data)
        sut.weathers = weather
        
        let vm = sut.viewModel(for: 0)
        XCTAssertNotNil(vm)
        XCTAssertTrue(vm.temp == "", vm.temp)
        
    }
    func testloadData() {
        sut.loadData()
        let exp = expectation(description: "wait")
        sut.dataUpdated = { [weak self] in
            XCTAssertTrue(self?.sut.numberOfDays ?? 0 > 0)
            exp.fulfill()
        }
        sut.dataUpdated?()
        waitForExpectations(timeout: 3, handler: nil)
    }

}

