//
//  DayWeatherCellViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
class DayWeatherCellViewModel: ListDayCellViewModel {
}

extension DayWeatherCellViewModel: DayWeatherCellRepresentable {
    var createdDate: String {
        let formater = ISO8601DateFormatter()
        formater.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withTimeZone,
            .withFractionalSeconds,
            .withDashSeparatorInDate
            
        ]
        let date = formater.date(from: weatherData.created ?? "")
        self.outputFormatter.dateFormat = "EEEE, dd hh a"
        return self.outputFormatter.string(from: date ?? Date())
    }
}

extension DayWeatherCellViewModel {
    var weatherName: String {
        return weatherData.weatherStateName ?? ""
    }
}
extension DayWeatherCellViewModel {
    var temp: String {
        guard let temp = weatherData.theTemp else {return ""}
        let tempMeasure = Measurement(value: temp, unit: UnitTemperature.celsius)
        formater.numberFormatter.minimumFractionDigits = 0
        formater.numberFormatter.maximumFractionDigits = 0
        return formater.string(from: tempMeasure)
    }
}
extension DayWeatherCellViewModel {
    var predictability: String {
        let pred = NSNumber(value: weatherData.predictability ?? 0)
        let percentFormater = NumberFormatter()
        percentFormater.numberStyle = .percent
        percentFormater.multiplier = 1
        percentFormater.maximumFractionDigits = 0
        percentFormater.minimumFractionDigits = 0
        return percentFormater.string(from: pred) ?? "0%"
    }
}
extension DayWeatherCellViewModel {
    var weatherStateAbb: String {
        let abbre =  weatherData.weatherStateAbbr ?? ""
        return abbre
    }
}
