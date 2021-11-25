//
//  ListDayViewRepresentable.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//

import Foundation
protocol ListDayWeatherViewRepresentable {
    var dataUpdate: (() -> Void)? { get set }
    
    var downloadFailed: ((Error) -> Void)? { get set }
       
    func loadData()
    
    var numberOfDays: Int { get }
    
    func viewModel(for index: Int) -> ListDayCellRepresentable
    
    var title: String { get }
}
