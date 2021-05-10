//
//  NavigationBuilder.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/10.
//

import SwiftUI

enum NavigationDestinationBuilder {
    
    static func makeCurrentWeatherView(withCity city: String) -> some View {
        let viewModel = CurrentWeatherViewModel(city: city)
        
        return CurrentWeatherView(viewModel: viewModel)
    }
}
