//
//  ListDayCellRepresentable.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//

import Foundation
protocol ListDayCellRepresentable {
    var dayName: String { get }
    
    var dayTemp: String { get }
    
    var imageURl: URL?{ get }
}
