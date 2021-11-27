//
//  DayWeatherCellViewModelTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/24/21.
//

import XCTest
@testable import MusalaSoftiOSTask

class DayWeatherCellViewModelTest: XCTestCase {
    var sut: DayWeatherCellViewModel!
    var weathers: [ConsolidatedWeatherModel]!

    override func setUpWithError() throws {
        let data = loadStubFromBundle(withName: "day", extension: "json")
        weathers = try! JSONDecoder().decode([ConsolidatedWeatherModel].self, from: data)
        sut = DayWeatherCellViewModel(weatherData: weathers.first!)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWeatherStateAtt(){
        XCTAssertNotNil(sut.weatherStateAbb)
        XCTAssertTrue(sut.weatherStateAbb.isEmpty == false)
        XCTAssertTrue(sut.weatherStateAbb == "lr")
    }
    
    func testCurrentTempwithNull() {
        let temp = sut.temp
        XCTAssertNotNil(temp)
        XCTAssertTrue(sut.temp.isEmpty)
    }
    
    func testCurrentTempinDay2() {
        sut = DayWeatherCellViewModel(weatherData: weathers.last!)
        XCTAssertNotNil(sut.temp)
        XCTAssertTrue(sut.temp == "13°C",sut.temp)
    }
    
    func testCreatedDate() {
        let date = sut.createdDate
        XCTAssertNotNil(date)
        XCTAssertTrue(date == "Saturday, 27 06 p.m.", date)
        XCTAssertTrue(date.components(separatedBy: " ").count == 4)
    }
    func testPredictablity(){
        let predi = sut.predictability
        XCTAssertNotNil(predi)
        XCTAssertTrue(predi.contains("%"))
        XCTAssertTrue(predi == "75%")
    }
    func testWeatherName() {
        let name = sut.weatherName
        XCTAssertNotNil(name)
        XCTAssertTrue(name == "Light Rain")
    }
    
}
