//
//  ListDayCellViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//

import Foundation
class ListDayCellViewModel {
    let inputFormatter = DateFormatter()
    let outputFormatter = DateFormatter()
    let outputFormatter2 = DateFormatter()
    let formater = MeasurementFormatter()
    
    var weatherData: ConsolidatedWeatherModel
    
    init(weatherData: ConsolidatedWeatherModel) {
        self.weatherData = weatherData
        formater.unitOptions = .providedUnit
        formater.unitStyle = .short
    }
    
    var dayName: String {
        debugPrint("date:", weatherData.applicableDate ?? "")
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let date = inputFormatter.date(from: weatherData.applicableDate ?? "")
        guard  let date = date else {return ""}
        if Calendar.current.isDateInToday(date) {
            outputFormatter.doesRelativeDateFormatting = true
            outputFormatter.timeStyle = .none
            outputFormatter.dateStyle = .medium
            return outputFormatter.string(from: date)
        }else{
           // outputFormatter.doesRelativeDateFormatting = false
            outputFormatter2.dateFormat = "EEEE"
            return outputFormatter2.string(from: date)
        }
    }
    
    var dayTemp: String {
        let minTempMeasure = Measurement(value: weatherData.minTemp ?? 0, unit: UnitTemperature.celsius)
        let maxTempMeasure = Measurement(value: weatherData.maxTemp ?? 0, unit: UnitTemperature.celsius)
        formater.numberFormatter.minimumFractionDigits = 0
        formater.numberFormatter.maximumFractionDigits = 0
        return "\(formater.string(from: minTempMeasure)) - \(formater.string(from: maxTempMeasure))"
    }
    
    var imageURl: URL?{
        let imageURLString = "https://www.metaweather.com/static/img/weather/png/\(weatherData.weatherStateAbbr ?? "").png"
        let url = URL(string: imageURLString)
        return url
    }
}
extension ListDayCellViewModel: ListDayCellRepresentable { }
