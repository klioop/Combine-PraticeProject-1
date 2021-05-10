//
//  CurrentWeatherViewRow.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/10.
//

import SwiftUI

struct CurrentWeatherViewRow: View {
    
    let viewModel: CurrentWeatherViewRowViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            
            MapView(coordinate: viewModel.coordinate)
                .cornerRadius(25)
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                
                HStack{
                    Text("현재 온도:")
                    Text("\(viewModel.temperature)˚")
                }
                .padding(10)
                
                HStack{
                    Text("체감 온도:")
                    Text("\(viewModel.feelsLike)˚")
                }
                .padding(10)
                
                HStack{
                    Text("습도:")
                    Text("\(viewModel.humidity)")
                }
                .padding(10)
            }
            
        }
    }
}

struct CurrentWeatherViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherViewRow(viewModel: CurrentWeatherViewRowViewModel.defaultValue)
    }
}
