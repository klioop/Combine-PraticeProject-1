//
//  WeatherFetchError.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation

enum WeatherFetchError: Error {
    case parsingError(description: String)
    case networkError(description: String)
}
