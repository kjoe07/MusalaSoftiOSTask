//
//  CompositionalRoot.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
class CompositionalRoot {
    func coreDatamanager() -> CoreDataManager {
        return CoreDataManager()
    }
    
    func listCitiesViewModel() -> ListCitiesViewViewModel {
        let cdm = coreDatamanager()
        let factory = ViewModelFactory()
        let viewModel = ListCitiesViewViewModel(factory: factory, manager: cdm)
        return viewModel
    }
    static let shared = CompositionalRoot()
    
    private init(){
        monitor = NetworkMonitor()
    }
    let monitor: NetworkMonitor
}
