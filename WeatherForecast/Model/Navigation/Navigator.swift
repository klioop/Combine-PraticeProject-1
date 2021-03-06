//
//  Navigator.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/10.
//

import SwiftUI

enum Route {
    case currentWeatherView(CurrentWeatherViewModel)
}

struct Navigator {
    
    @ViewBuilder static func navigate<V>(_ route: Route, content: () -> V) -> some View where V: View {
        
        switch route {
        case .currentWeatherView(let viewModel):
            NavigationLink(destination: CurrentWeatherView(viewModel: viewModel)) {
                content()
            }
        }
    }
}
