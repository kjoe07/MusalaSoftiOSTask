//
//  Services.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
protocol Services{
    func getData<T:Codable>(completion: @escaping (Result<T,Error>)-> Void)
}

class RemoteLoaderWithLocalFeedBack: Services{
    var remote: Services!
    var local: Services!
    var monitor: NetworkMonitor
    func getData<T:Codable>( completion: @escaping (Result<T, Error>) -> Void) {
        if  monitor.isNetworkAvailable(){
            return remote.getData(completion: {(result: Result<T,Error>) in
                switch result{
                case.success(let d):
                    completion(.success(d))
                case .failure(let e):
                    completion(.failure(e))
                }
            })
        }else{
            return local.getData(completion: {(result: Result<T,Error>) in
                switch result{
                case .success(let d):
                    completion(.success(d))
                case .failure(let e):
                    completion(.failure(e))
                }
            })
        }
    }
    
    init(remote: Services,local: Services, monitor: NetworkMonitor) {
        self.remote = remote
        self.local = local
        self.monitor = monitor
    }
}
