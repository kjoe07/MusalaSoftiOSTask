//
//  LocationEndpoint.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
struct LocationEndpoint: Endpoint {
    var path: String
    var queryItems: [URLQueryItem]?
    var method: Mehtod
}

extension LocationEndpoint {    
    func urlRequest() throws -> URLRequest {
        guard let url = self.url else {throw customError.badRequest}
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        return request
    }    
}
