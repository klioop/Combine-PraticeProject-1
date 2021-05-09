//
//  DateFormatter.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation

let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    
    return formatter
}()

let monthFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM"
    
    return formatter
}()
    
