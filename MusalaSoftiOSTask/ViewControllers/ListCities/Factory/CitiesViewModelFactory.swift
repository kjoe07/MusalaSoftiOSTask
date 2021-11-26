//
//  CitiesViewModelFactory.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
struct ViewModelFactory {
    func viewModel(for location: Location) -> CitiesTableViewCellRepresentable {
        return CitiesTableViewCellViewModel(location: location)
    }
    
    func listDayViewVieModel(manager: CoreDataManager, location: Location) -> ListDayWeatherViewRepresentable{
        let endpoint = LocationEndpoint(path: "/api/location/\(location.woeid)/", queryItems: nil, method: .get)
        let remote = RemoteDataService(loader: NetworkLoader(), endpoint: endpoint)
        let local = LocalDataService(dbManager: manager, woeid: location.woeid.intValue)
        let service = RemoteLoaderWithLocalFeedBack(remote: remote, local: local, monitor: CompositionalRoot.shared.monitor)
        let vm = ListDayViewViewModel(service: service, location: location, manager: manager, factory: ViewModelFactory())
        return vm
    }
    
    func dayWeatherViewViewModel(manager: CoreDataManager, date: String, woeid: Int) -> DayWeatherViewRepresentable {
        let newDate = date.components(separatedBy: "-")
        let endpoint = LocationEndpoint(path: "/api/location/\(woeid)/\(newDate[0])/\(newDate[1])/\(newDate[2])/", queryItems: nil, method: .get)
        let remote = RemoteDataService(loader: NetworkLoader(), endpoint: endpoint)
        let local = LocalDataService(dbManager: manager, woeid: woeid)
        let service = RemoteLoaderWithLocalFeedBack(remote: remote, local: local, monitor: CompositionalRoot.shared.monitor)
        let vm = DayWeatherViewViewModel(date: date, woeid: woeid, service: service)
        return vm
    }
        
}
