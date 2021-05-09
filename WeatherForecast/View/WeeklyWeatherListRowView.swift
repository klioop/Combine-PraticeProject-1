//
//  WeeklyWeatherViewListRowView.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import SwiftUI

struct WeeklyWeatherListRowView: View {
    
    var viewModel: WeatherViewListRowModel
    
    var body: some View {
        
        HStack {
            
            VStack {
                Text(viewModel.day)
                Text(viewModel.month)
            }
            .font(.headline)
            
            VStack(alignment: .leading){
                Text(viewModel.title)
                    .font(.title2)
                Text(viewModel.description)
                    .font(.body)
            }
            .padding(.leading)
            
            Spacer()
            
            VStack{
                Text("최고기온: \(viewModel.maxTemperature)˚")
                    .foregroundColor(.red)
                Text("최저기온: \(viewModel.minTemperature)˚")
                    .foregroundColor(.blue)
            }
            .font(.body)
        }
        .padding()
        
    }
}

struct WeeklyWeatherViewListRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListRowView(viewModel: WeatherViewListRowModel.defaultValue)
            .previewLayout(.fixed(width: 500, height: 100))
    }
}
