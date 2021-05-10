//
//  CurrentWeatherView.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/10.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @ObservedObject var viewModel: CurrentWeatherViewModel
    
    var body: some View {
        
        List {
         content()
            .ignoresSafeArea(edges: .horizontal)
            .onAppear{
                viewModel.refresh()
            }
        }
        .navigationBarTitle(Text("\(viewModel.city)"), displayMode: .inline)
        .listStyle(GroupedListStyle())
        
    }
}

extension CurrentWeatherView {
    
    @ViewBuilder func content() -> some View {
        
        if let dataSource = viewModel.dataSource {
            CurrentWeatherViewRow(viewModel: dataSource)
        } else {
            Text("Loading \(viewModel.city)'s weather...")
                .foregroundColor(.gray)
        }
    }
    
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            CurrentWeatherView(viewModel: CurrentWeatherViewModel(city: "Seoul"))
            
        }
        
    }
}
