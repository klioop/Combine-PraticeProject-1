//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    
    var weatherViewModel: WeeklyWeatherViewModel = WeeklyWeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            WeeklyWeatherView()
                .environmentObject(weatherViewModel)
        }
    }
}
