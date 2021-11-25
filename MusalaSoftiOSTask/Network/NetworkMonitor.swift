//
//  NetWorkPath.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
import Network
class NetworkMonitor {
    
    var pathMonitor: NWPathMonitor!
    var path: NWPath?
    lazy var pathUpdateHandler: ((NWPath) -> Void) = { (path: NWPath) in
        self.path = path
        var status = false
        if path.status == NWPath.Status.satisfied {
            print("Connected")
            status = true
        } else if path.status == NWPath.Status.unsatisfied {
            print("unsatisfied")
            status = false
        } else if path.status == NWPath.Status.requiresConnection {
            print("requiresConnection")
            status = false
        }
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "networkChanged"), object: status )
    }
    
    let backgroudQueue = DispatchQueue.global(qos: .background)
    
    init() {
        pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = self.pathUpdateHandler
        pathMonitor.start(queue: backgroudQueue)
    }
    
    func isNetworkAvailable() -> Bool {
        if let path = self.path {
            if path.status == NWPath.Status.satisfied {
                return true
            }
        }
        return false
    }
}
