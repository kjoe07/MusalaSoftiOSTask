//
//  ListCitiesViewViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/22/21.
//

import Foundation
class ListCitiesViewViewModel {
    
    internal var cities: [Location] = [] {
        didSet{
            dataUpdated?()
        }
    }
    
    var dataUpdated: (() -> Void)?
    
    private var factory: CitiesViewModelFactory
    private var manager: CoreDataManager
    
    init(factory: CitiesViewModelFactory, manager: CoreDataManager) {
        self.factory = factory
        self.manager = manager
        readData()
    }
    
    var numberOfCities: Int {
        cities.count
    }
    
    func viewModel(for index: Int) -> CitiesTableViewCellRepresentable{
        return factory.viewModel(for: cities[index])
    }
    
    private func readData() {
        self.manager.fetchLinks(completion: { [weak self] cities in
            self?.cities = cities
        })
    }
}
extension ListCitiesViewViewModel: ListCitiesViewRepresentable {}
