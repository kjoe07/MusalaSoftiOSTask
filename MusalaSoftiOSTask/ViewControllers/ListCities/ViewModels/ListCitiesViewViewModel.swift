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
    
    private var factory: ViewModelFactory
    var manager: CoreDataManager
    
    init(factory: ViewModelFactory, manager: CoreDataManager) {
        self.factory = factory
        self.manager = manager
        readData()
        NotificationCenter.default.addObserver(forName: .NSManagedObjectContextDidSave, object: manager.persistentContainer.viewContext, queue: .main) { [weak self] _ in
            self?.readData()
        }
    }
    
    var numberOfCities: Int {
        cities.count
    }
    
    func viewModel(for index: Int) -> CitiesTableViewCellRepresentable{
        return factory.viewModel(for: cities[index])
    }
    
    func listDayViewModel(for index: Int) -> ListDayWeatherViewRepresentable {
        return factory.listDayViewVieModel(manager: manager, location: cities[index])
    }
    
    private func readData() {
        self.manager.fetchLinks(completion: { [weak self] cities in
            self?.cities = cities
        })
    }
}
extension ListCitiesViewViewModel: ListCitiesViewRepresentable {}
