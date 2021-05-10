//
//  CurrentWeatherViewRowViewModel.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/10.
//

import SwiftUI
import MapKit


struct CurrentWeatherViewRowViewModel {
    
    private let item: CurrentWeatherResponse
    
    init(item: CurrentWeatherResponse) {
        self.item = item
    }
    
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    
    var feelsLike: String {
        return String(format: "%1.f", item.main.feelsLike)
    }
    
    var humidity: String {
        return String(format: "%1.f", item.main.humidity)
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: item.coord.lat, longitude: item.coord.lon)
    }
}

extension CurrentWeatherViewRowViewModel {
    static var defaultValue: CurrentWeatherViewRowViewModel {
        return CurrentWeatherViewRowViewModel(
            item: CurrentWeatherResponse(coord: CurrentWeatherResponse.Coord(lon: 20, lat: -20),
                                         main: CurrentWeatherResponse.Main(
                                            temp: 20.23,
                                            feelsLike: 19.5,
                                            tempMax: 23,
                                            tempMin: 13,
                                            humidity: 5)))
    }
}
