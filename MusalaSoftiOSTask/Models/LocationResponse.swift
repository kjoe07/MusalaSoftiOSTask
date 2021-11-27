//
//  LocationResponse.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/24/21.
//

import Foundation
struct ResponseWoeid: Codable {
    var consolidatedWeather : [ConsolidatedWeatherModel]?
    let time : String?
    let sunRise : String?
    let sunSet : String?
    let timezoneName : String?
    let parent: ParentModel?
    let sources: [SourcesModel]?
    let title: String?
    let locationType : String?
    let woeid : Int?
    let lattLong : String?
    let timezone : String?
    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case time = "time"
        case sunRise = "sun_rise"
        case sunSet = "sun_set"
        case timezoneName = "timezone_name"
        case parent = "parent"
        case sources = "sources"
        case title = "title"
        case locationType = "location_type"
        case woeid = "woeid"
        case lattLong = "latt_long"
        case timezone = "timezone"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        consolidatedWeather = try values.decodeIfPresent([ConsolidatedWeatherModel].self, forKey: .consolidatedWeather)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        sunRise = try values.decodeIfPresent(String.self, forKey: .sunRise)
        sunSet = try values.decodeIfPresent(String.self, forKey: .sunSet)
        timezoneName = try values.decodeIfPresent(String.self, forKey: .timezoneName)
        parent = try values.decodeIfPresent(ParentModel.self, forKey: .parent)
        sources = try values.decodeIfPresent([SourcesModel].self, forKey: .sources)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        locationType = try values.decodeIfPresent(String.self, forKey: .locationType)
        woeid = try values.decodeIfPresent(Int.self, forKey: .woeid)
        lattLong = try values.decodeIfPresent(String.self, forKey: .lattLong)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }
    
    //TODO: - init from NSManagedObject
    
    init(model: Location) {
        let cons = model.consolidateWeather ?? []
        var consArray = [ConsolidatedWeatherModel]()
        for con in cons {
            let consolidateWeatherModel = con as! ConsolidatedWeather
            let consolidates = ConsolidatedWeatherModel(consolidatedWeather: consolidateWeatherModel)
            consArray.append(consolidates)
        }
        self.consolidatedWeather = consArray
//        self.consolidatedWeather = consArray.sorted(by: {
//            $0.id ?? 0 < $1.id ?? 0
//        })
        time = model.time
        sunRise = model.sunRise
        sunSet = model.sunSet
        timezoneName = model.timeZoneName
       // parent =
        let sources = model.sources ?? []
        var sourceArray = [SourcesModel]()
        for source in sources {
            let nSource = SourcesModel(source: source)
            sourceArray.append(nSource)
        }
        self.sources =  sourceArray
        title = model.title
        locationType = model.locationType
        woeid = model.woeid.intValue
        lattLong = model.lattLong
        timezone = model.timeZone
        if let paren = model.parent {
            self.parent = ParentModel(parent: paren)
        }else {
            parent = nil
        }
        
    }
}


