//
//  ContentView.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import SwiftUI
import Combine

struct WeeklyWeatherView: View {
    
    @EnvironmentObject var viewModel: WeeklyWeatherViewModel
    
    var body: some View {
        
        NavigationView{
            
            List {
                
                searchBar
                
                if viewModel.dataSourceForView.isEmpty {
                    emptyView
                } else {
//                    currentWeatherView
                    currentWeatherView2
                    weatherListRowView
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weather 🌥")
            
        }
    }
}

extension WeeklyWeatherView {
    
    var searchBar: some View {
            TextField("e.g. Seoul", text: $viewModel.city)
    }
    
    var emptyView: some View {
        Section {
            Text("No Result")
                .foregroundColor(.gray)
        }
    }
    
//    var currentWeatherView: some View {
//        Section{
//            NavigationLink(destination: viewModel.currentWeatherView) {
//                Text("\(viewModel.city) 지역의 현재 날씨")
//                    .foregroundColor(.gray)
//            }
//        }
//    }
    var currentWeatherView2: some View {
        Section{
            Navigator.navigate(.currentWeatherView(CurrentWeatherViewModel(city: viewModel.city))) {
                Text("\(viewModel.city) 지역의 현재 날씨")
            }
        }
    }
    
    var weatherListRowView: some View {
        Section{
            ForEach(viewModel.dataSourceForView) { data in
                WeeklyWeatherListRowView(viewModel: data)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherView()
            .environmentObject(WeeklyWeatherViewModel())
    }
}
