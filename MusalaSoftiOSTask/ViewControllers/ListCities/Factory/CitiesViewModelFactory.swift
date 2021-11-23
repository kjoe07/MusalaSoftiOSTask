//
//  CitiesViewModelFactory.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
struct CitiesViewModelFactory {
    func viewModel(for location: Location) -> CitiesTableViewCellRepresentable {
        return CitiesTableViewCellViewModel(location: location)
    }
}
