//
//  WeeklyWeatherViewModel.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation
import Combine

class WeeklyWeatherViewModel: ObservableObject, Identifiable {
    
    @Published var city: String = ""
    @Published var dataSourceForView: [WeatherViewListRowModel] = []
    
    private let weatherFetcher: WeatherFetchable = WeatherFetcher()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [unowned self] value in
                self.fetchWeather(withCity: value)
            })
            .store(in: &disposables)
    }
}

extension WeeklyWeatherViewModel {
    
    func fetchWeather(withCity city: String) {
        weatherFetcher
            .weeklyWeatherForecast(withCity: city)
            .map{ responseData -> [WeatherViewListRowModel] in
                print("First Fetched @@@@@@@@@@@@", responseData)
                return responseData.list.map(WeatherViewListRowModel.init)
            }
            .map(Array.removeDuplicates)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] result in
                switch result {
                case .finished:
                    break
                case .failure(_):
                    self.dataSourceForView = []
                }
            }, receiveValue: { [unowned self] rowViewModelArray in
                self.dataSourceForView = rowViewModelArray
            })
            .store(in: &disposables)
    }
}
