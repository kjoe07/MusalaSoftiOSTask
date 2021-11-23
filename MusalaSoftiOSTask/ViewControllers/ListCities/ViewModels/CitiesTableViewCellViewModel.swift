//
//  CitiesTableViewCellViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
struct CitiesTableViewCellViewModel {
    let location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    var locationName: String {
        location.title ?? ""
    }
}

extension CitiesTableViewCellViewModel: CitiesTableViewCellRepresentable {}
