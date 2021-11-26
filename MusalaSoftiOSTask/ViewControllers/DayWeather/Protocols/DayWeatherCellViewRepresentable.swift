//
//  DayWeatherCellViewRepresentable.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
protocol DayWeatherCellRepresentable: ListDayCellRepresentable {
    var createdDate: String { get }
    var weatherName: String { get }
    var temp: String { get }
    var predictability: String { get }
    var weatherStateAbb: String { get }
}
