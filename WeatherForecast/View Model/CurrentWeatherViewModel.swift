//
//  CurrentWeatherViewModel.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/10.
//

import Foundation
import Combine


class CurrentWeatherViewModel: ObservableObject {
    
    @Published var dataSource: CurrentWeatherViewRowViewModel?
    
    let city: String
    private let weatherFetcher = WeatherFetcher()
    private var disposables = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
    }
    
}

extension CurrentWeatherViewModel {
    
    func refresh() {
        weatherFetcher
            .currentWeather(withCity: city)
            .map{ CurrentWeatherViewRowViewModel(item: $0) }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] result in
                switch result {
                
                case .finished:
                    break
                case .failure(_):
                    self.dataSource = nil
                }
                
            }, receiveValue: { [unowned self] value in
                self.dataSource = value
            })
            .store(in: &disposables)
    }
    
}

