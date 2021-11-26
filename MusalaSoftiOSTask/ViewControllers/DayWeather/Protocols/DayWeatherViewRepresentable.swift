//
//  DayWeatherViewRepresentable.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
protocol DayWeatherViewRepresentable {
    func loadData()
    var numberOfDays: Int { get }
    func viewModel(for index: Int) -> DayWeatherCellRepresentable
    var dataUpdated: (()->Void)? { get set }
    var errorHappen: ((Error)->Void)? { get set }
    var title: String {get}
}
