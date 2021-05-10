//
//  APIResponse.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation

struct WeeklyWeatherResponse: Decodable {
    
    let list: [ListItem]
    
    struct ListItem: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case main, weather
            case date = "dt"
        }
        
        let date: Date
        let main: Main
        let weather: [WeatherItem]
    }
    
    struct Main: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
        
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
    }
    
    struct WeatherItem: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
        
        let main: MainEnum
        let weatherDescription: String
    }
    
    enum MainEnum: String, Decodable {
      case clear = "Clear"
      case clouds = "Clouds"
      case rain = "Rain"
    }
}

struct CurrentWeatherResponse: Decodable {
    
    let coord: Coord
    let main: Main
    
    struct Coord: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct Main: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case temp, humidity
            case feelsLike = "feels_like"
            case tempMax = "temp_max"
            case tempMin = "temp_min"
        }
        
        let temp: Double
        let feelsLike: Double
        let tempMax: Double
        let tempMin: Double
        let humidity: Int
    }
}
