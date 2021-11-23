//
//  ListCitiesViewViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//

import Foundation
struct ListCitiesViewViewModel {
    
    internal var cities: [Location] = []
    
    private var factory: CitiesViewModelFactory
    
    init(factory: CitiesViewModelFactory) {
        self.factory = factory
    }
    
    
    var numberOfCities: Int {
        cities.count
    }
    
    func viewModel(for index: Int) -> CitiesTableViewCellRepresentable{
        return factory.viewModel(for: cities[index])
    }
}
extension ListCitiesViewViewModel: ListCitiesViewRepresentable {}
