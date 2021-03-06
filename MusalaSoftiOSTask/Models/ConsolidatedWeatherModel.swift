//
//  ConsolidatedWeatherModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/24/21.
//

import Foundation
struct ConsolidatedWeatherModel: Codable {
    let id : Int?
    let weatherStateName: String?
    let weatherStateAbbr: String?
    let windDirectionCompass: String?
    let created: String?
    var applicableDate: String?
    let minTemp: Double?
    let maxTemp: Double?
    let theTemp: Double?
    let windSpeed: Double?
    let windDirection: Double?
    let airPressure: Double?
    let humidity: Double?
    let visibility: Double?
    let predictability: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created = "created"
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity = "humidity"
        case visibility = "visibility"
        case predictability = "predictability"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        weatherStateName = try values.decodeIfPresent(String.self, forKey: .weatherStateName)
        weatherStateAbbr = try values.decodeIfPresent(String.self, forKey: .weatherStateAbbr)
        windDirectionCompass = try values.decodeIfPresent(String.self, forKey: .windDirectionCompass)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        applicableDate = try values.decodeIfPresent(String.self, forKey: .applicableDate)
        minTemp = try values.decodeIfPresent(Double.self, forKey: .minTemp)
        maxTemp = try values.decodeIfPresent(Double.self, forKey: .maxTemp)
        theTemp = try values.decodeIfPresent(Double.self, forKey: .theTemp)
        windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
        windDirection = try values.decodeIfPresent(Double.self, forKey: .windDirection)
        airPressure = try values.decodeIfPresent(Double.self, forKey: .airPressure)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        predictability = try values.decodeIfPresent(Int.self, forKey: .predictability)
    }
    
    init(consolidatedWeather: ConsolidatedWeather) {
        id = consolidatedWeather.id.intValue
        weatherStateName = consolidatedWeather.weatherStateName
        weatherStateAbbr = consolidatedWeather.weatherStateAbbr
        windDirectionCompass = consolidatedWeather.windDirectionCompass
        created = consolidatedWeather.created
        applicableDate = consolidatedWeather.applicableDate
        minTemp = consolidatedWeather.minTemp?.doubleValue
        maxTemp = consolidatedWeather.maxTemp?.doubleValue
        theTemp = consolidatedWeather.temp?.doubleValue
        windSpeed = consolidatedWeather.windSpeed?.doubleValue
        windDirection = consolidatedWeather.windDirection?.doubleValue
        airPressure = consolidatedWeather.airPressure?.doubleValue
        humidity = consolidatedWeather.airPressure?.doubleValue
        visibility = consolidatedWeather.visibility?.doubleValue
        predictability = consolidatedWeather.predictability?.intValue
    }
}
//extension ConsolidatedWeatherModel: Comparable {
//    static func < (lhs: ConsolidatedWeatherModel, rhs: ConsolidatedWeatherModel) -> Bool {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        let date1 = formatter.date(from: lhs.applicableDate ?? "")
//        let date2 = formatter.date(from: rhs.applicableDate ?? "")
//        Calendar.current.
//    }
//    
    
//}
