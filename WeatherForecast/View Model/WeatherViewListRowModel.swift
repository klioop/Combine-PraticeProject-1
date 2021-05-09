//
//  WeatherViewListRowModel.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation

class WeatherViewListRowModel: Identifiable {
    
    let item: WeeklyWeatherResponse.ListItem
    
    init(item: WeeklyWeatherResponse.ListItem) {
        self.item = item
    }
    
    var id: String {
        return day + temperature + title
    }
    
    var day: String {
        return dayFormatter.string(from: item.date)
    }
    
    var month: String {
        return monthFormatter.string(from: item.date)
    }
    
    var temperature: String {
        return String(format: "%1.f", item.main.temp)
    }
    
    var maxTemperature: String {
        return String(format: "%.1f", item.main.tempMax)
    }
    
    var minTemperature: String {
        return String(format: "%.1f", item.main.tempMin)
    }
    
    var title: String {
        guard let title = item.weather.first?.main.rawValue else { return "No Title" }
        return title
    }
    
    var description: String {
        guard let description = item.weather.first?.weatherDescription else { return "No description" }
        return description
    }
}

extension WeatherViewListRowModel {
    static var defaultValue: WeatherViewListRowModel {
        
        return WeatherViewListRowModel(item:
                                        WeeklyWeatherResponse.ListItem(date: Date(),
                                                                       main: WeeklyWeatherResponse.Main(temp: 20.11,
                                                                                                        feelsLike: 20.11,
                                                                                                        tempMin: 10.11,
                                                                                                        tempMax: 23.11),
                                                                       weather: [WeeklyWeatherResponse.WeatherItem(
                                                                                    main: WeeklyWeatherResponse.MainEnum.clear,
                                                                                    weatherDescription: "Today is always clear haha")]))
    }
}

extension WeatherViewListRowModel: Hashable {
    static func == (lhs: WeatherViewListRowModel, rhs: WeatherViewListRowModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(day)
    }
}
