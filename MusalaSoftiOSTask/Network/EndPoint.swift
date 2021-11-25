//
//  EndPoint.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
let baseUrl = "www.metaweather.com"
protocol Endpoint {
    var path: String { get set}
    var queryItems: [URLQueryItem]? { get set}
//    var headers: [String:String]? {get set}
    var method: Mehtod { get set }
//    var params: [String:Any]? {get set}
    var url: URL? {get }
    func urlRequest() throws -> URLRequest 
}
extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseUrl
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

enum Mehtod: String{
    case post
    case get
    case put
    case delete
    case batch
}
