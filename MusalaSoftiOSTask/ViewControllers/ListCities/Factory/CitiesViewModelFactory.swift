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
    
    func listDayViewVieModel(manager: CoreDataManager, location: Location) -> ListDayViewViewModel {
        let endpoint = LocationEndpoint(path: "/api/location/\(location.woeid)/", queryItems: nil, method: .get)
        let remote = RemoteDataService(loader: NetworkLoader(), endpoint: endpoint)
        let local = LocalDataService(dbManager: manager)
        let service = RemoteLoaderWithLocalFeedBack(remote: remote, local: local, monitor: CompositionalRoot.shared.monitor)
        let vm = ListDayViewViewModel(service: service, location: location, manager: manager)
        return vm
    }
        
}
