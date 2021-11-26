//
//  DayWeatherViewViewModel.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import Foundation
class DayWeatherViewViewModel {
    let date: String
    let woeid: Int
    let service: Services
    
    var weathers: [ConsolidatedWeatherModel]?
    var dataUpdated: (()->Void)?
    var errorHappen: ((Error)->Void)?
    init(date: String, woeid: Int, service: Services){
        self.date = date
        self.woeid = woeid
        self.service = service
    }
  
    func loadData() {
        service.getData(completion: {[weak self] (result: Result<[ConsolidatedWeatherModel],Error>) in
            guard let self = self else {return}
            switch result {                
            case .success(let value):
                self.weathers = value
                self.dataUpdated?()
            case .failure(let error):
                self.errorHappen?(error)
            }
            
        })
    }
    
    var numberOfDays: Int {
        return weathers?.count ?? 0
    }
    func viewModel(for index: Int) -> DayWeatherCellRepresentable{
        return DayWeatherCellViewModel(weatherData: (weathers?[index])!)
    }
    
    var title: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.date(from: date)
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.doesRelativeDateFormatting = true
        return formatter.string(from: currentDate ?? Date())
    }
    
}

extension DayWeatherViewViewModel: DayWeatherViewRepresentable { }
