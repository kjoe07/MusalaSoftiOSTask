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
        //formater.unitOptions = .providedUnit
        formater.unitStyle = .short
        formater.locale = Calendar.current.locale
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
    
    var windSpeed: String {
        let speedUnit = Measurement(value: weatherData.windSpeed ?? 0, unit: UnitSpeed.milesPerHour)
        //formater.unitOptions = .providedUnit
        formater.numberFormatter.maximumFractionDigits = 2
        return "Wind: \(formater.string(from: speedUnit))"
    }
    
    var windDirectionCompass: String {
        return weatherData.windDirectionCompass ?? ""
    }
    
    var windDirection: String {
        let degrees = Measurement(value: weatherData.windDirection ?? 0, unit: UnitAngle.degrees)
        formater.numberFormatter.maximumFractionDigits = 3
        //formater.unitOptions = .providedUnit
        return formater.string(from: degrees)
    }
    var airPresure: String {
        let mbar = Measurement(value: weatherData.airPressure ?? 0, unit: UnitPressure.millibars)
        //formater.unitOptions = .providedUnit
        formater.numberFormatter.maximumFractionDigits = 1
        formater.numberFormatter.usesGroupingSeparator = false
        return formater.string(from: mbar)
    }
    var humidity: String {
        let humidity = NSNumber(value: weatherData.humidity ?? 0)
        let percentFormater = NumberFormatter()
        percentFormater.numberStyle = .percent
        percentFormater.multiplier = 1
        percentFormater.maximumFractionDigits = 0
        percentFormater.minimumFractionDigits = 0
        return "H: \(percentFormater.string(from: humidity) ?? "") "
    }
    
    var visibility: String {
        let visibilityMeasure = Measurement(value: weatherData.visibility ?? 0, unit: UnitLength.miles)
        formater.numberFormatter.maximumFractionDigits = 2
       // formater.unitOptions = .providedUnit
        return "V: \(formater.string(from: visibilityMeasure))"
        
    }
}
extension ListDayCellViewModel: ListDayCellRepresentable {
}
