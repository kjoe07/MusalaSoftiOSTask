//
//  DataLoader.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
protocol DataLoader {
    func loadData(request: URLRequest?,completion: @escaping (Result<Data,Error>) -> Void )
}

struct NetworkLoader: DataLoader{
    var session: URLSession    
    func loadData(request: URLRequest?, completion: @escaping (Result<Data,Error>) -> Void) {
        guard let request = request else {
            completion(.failure(customError.badRequest))
            return }
            let task = session.dataTask(with: request){data,response,error in
            if error != nil{
                guard let error = error else { return }
                completion(.failure(error))
            }else {
                
                let r = response as! HTTPURLResponse
                if r.statusCode == 401{
                    completion(.failure(customError.unAuthorized))
                }else if r.statusCode >= 200 && r.statusCode <= 209{
                    guard let data = data else {return}
                    completion(.success(data))
                }else{
                    completion(.failure(customError.badData))
                }
            }
        }
        task.resume()
    }
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
enum customError: String, Error,LocalizedError{
    case badRequest
    case badData
    case unAuthorized
    case unKnown
    case invalidUpdate
    var errorDescription: String?{
        return self.rawValue
    }
}
