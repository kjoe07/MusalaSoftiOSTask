//
//  SourcesModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/24/21.
//

import Foundation
struct SourcesModel: Codable {
    let title : String?
    let slug : String?
    let url : String?
    let crawlRate : Int?
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case slug = "slug"
        case url = "url"
        case crawlRate = "crawl_rate"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        crawlRate = try values.decodeIfPresent(Int.self, forKey: .crawlRate)
    }
    
    init(source: Sources) {
        title = source.tittle
        slug = source.slug
        url = source.url
        crawlRate = source.crawlRate?.intValue
    }
}
