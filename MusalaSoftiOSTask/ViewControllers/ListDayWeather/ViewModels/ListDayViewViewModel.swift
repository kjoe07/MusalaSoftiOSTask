//
//  ListDayViewViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//

import Foundation
class ListDayViewViewModel {
    let service: Services
    var location: Location!
    let manager: CoreDataManager!
    let factory: ViewModelFactory
    
    var consolidatedWeather: [ConsolidatedWeatherModel]?
    var dataUpdate: (() -> Void)?
    var downloadFailed: ((Error) -> Void)?
    
    init(service: Services, location: Location, manager: CoreDataManager, factory: ViewModelFactory) {
        self.service = service
        self.location = location
        self.manager = manager
        self.factory = factory
    }
    
    func loadData() {
        service.getData(completion: { [weak self] (result: Result<ResponseWoeid,Error>) in
            guard let self = self else {return}
            switch result {
            case .success(let values):
                print(values)
                self.consolidatedWeather = values.consolidatedWeather ?? []
                if CompositionalRoot.shared.monitor.isNetworkAvailable() {
                    ConsolidateWeatherBuilder.createReponseWoeidFromNSManagedObject(location: self.location, model: values, manager: self.manager)
                    self.manager.saveObject()
                }                
                self.dataUpdate?()
            case .failure(let error):
                print(error)
                self.downloadFailed?(error)
            }
        })
    }
    
    var numberOfDays: Int {
        return consolidatedWeather?.count ?? 0
    }
    
    func viewModel(for index: Int) -> ListDayCellRepresentable {
        return ListDayCellViewModel(weatherData: consolidatedWeather![index])
    }
    
    func dayWeatherViewViewModel(index: Int) -> DayWeatherViewRepresentable? {
        guard let date = consolidatedWeather?[index].applicableDate else {return nil}
        
        let viewModel = factory.dayWeatherViewViewModel(manager: manager, date: date, woeid: location.woeid.intValue)
        return viewModel
    }
    
    var title: String {
        location.title ?? ""
    }
}
extension ListDayViewViewModel: ListDayWeatherViewRepresentable { }
