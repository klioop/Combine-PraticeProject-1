//
//  ContentView.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import SwiftUI
import Combine

struct WeeklyWeatherView: View {
    
    var temp = WeatherFetcher()
    
    init() {
        
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherView()
    }
}
