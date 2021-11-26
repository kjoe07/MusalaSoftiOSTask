//
//  ListDayCellViewModelTest.swift
//  MusalaSoftiOSTaskTests
//
//  Created by kjoe on 11/25/21.
//

import XCTest
@testable import MusalaSoftiOSTask

class ListDayCellViewModelTest: XCTestCase {
    var sut: ListDayCellViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = loadStubFromBundle(withName: "day", extension: "json")
         let weathers = try   JSONDecoder().decode([ConsolidatedWeatherModel].self, from: data)
        sut = ListDayCellViewModel(weatherData: weathers.first!)
    }
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testDateShowTodayStringAfterChangedDateToToday() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayString = formatter.string(from: date)
        print("today String",todayString)
        sut.weatherData.applicableDate = todayString
        let sutDate = sut.dayName
        print("sutDate:",sutDate)
        XCTAssertTrue(sutDate == "Today")
    }
    
    func testTomorrowDateDoesNotShowToMorrowString() {
        let date = Date().addingTimeInterval(TimeInterval(84600))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayString = formatter.string(from: date)
        print("today String",todayString)
        sut.weatherData.applicableDate = todayString
        XCTAssertNotEqual(sut.dayName, "Tomorrow")
        XCTAssertTrue(sut.dayName.components(separatedBy: "-").count == 1)
        XCTAssertTrue((sut.dayName.components(separatedBy: "-").count > 2) == false)
    }
    func testViewModelDayIsSaturdayForApril272013(){
        XCTAssertEqual(sut.dayName,"Saturday")
    }
    
    //TODO: fix a locale for testing the string with formatters wichs depends on 
//    func testTemptextIs11MinAnd17MaxString() {
//        XCTAssertTrue(sut.dayTemp == "3°C - 10°C","sutDay is \(sut.dayTemp)")
//    }

    func testImageURLIsValid() {
        let imageURLString = "https://www.metaweather.com/static/img/weather/png/lr.png"
        XCTAssertNotNil(sut.imageURl)
        XCTAssertTrue(sut.imageURl == URL(string: imageURLString))
    }

}
