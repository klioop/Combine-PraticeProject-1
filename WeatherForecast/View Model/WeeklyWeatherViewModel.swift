//
//  WeeklyWeatherViewModel.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    
    @Published var city: String = ""
    @Published var dataSourceForView: [WeatherViewListRowModel] = []
    
    private let weatherFetcher: WeatherFetchable
    
    init(weatherFetcher: WeatherFetchable) {
        self.weatherFetcher = weatherFetcher
    }
    
}

extension WeeklyWeatherViewModel {
    
    func fetchWeather(withCity city: String) {
    
    }
}
