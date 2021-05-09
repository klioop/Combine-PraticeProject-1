//
//  WeatherFetcher.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation
import Combine

protocol WeatherFetchable {
    func weeklyWeatherForecast(withCity city: String) -> AnyPublisher<WeeklyWeatherResponse, WeatherFetchError>
}


struct API {
    static let scheme: String = "https"
    static let host: String = "api.openweathermap.org"
    static let path: String = "data/2.5"
    static let key = "7e6b02c7d7940fd34fe5b832b42d648e"
}

struct WeatherFetcher {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension WeatherFetcher {
    
    func createWeeklyWeatherURLComponents(withCity city: String) -> URLComponents {
        
        var components: URLComponents = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.path + "/forecast"
        
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: API.key)
        ]
        
        return components
    }
}

extension WeatherFetcher: WeatherFetchable {
    
    func weeklyWeatherForecast(withCity city: String) -> AnyPublisher<WeeklyWeatherResponse, WeatherFetchError> {
        
        return forecast(createWeeklyWeatherURLComponents(withCity: city))
        
    }
    
    func forecast<T>(_ components: URLComponents) -> AnyPublisher<T, WeatherFetchError> where T: Decodable {
        guard let url = components.url else {
            let error = WeatherFetchError.networkError(description: "cannot create url")
            
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .mapError { error in
                .networkError(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1) ) { pair in // pair = (responseData, response)
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, WeatherFetchError> {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError{ error in
                WeatherFetchError.parsingError(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}


