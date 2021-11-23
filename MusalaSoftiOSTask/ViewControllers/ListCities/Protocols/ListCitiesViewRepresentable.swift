//
//  ListCitiesViewRepresentable.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
protocol ListCitiesViewRepresentable {
    var numberOfCities: Int { get }
    func viewModel(for index: Int) -> CitiesTableViewCellRepresentable
}
