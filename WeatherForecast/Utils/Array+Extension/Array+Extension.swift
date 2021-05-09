//
//  Array+Extension.swift
//  WeatherForecast
//
//  Created by klioop on 2021/05/09.
//

import Foundation

extension Array where Element: Hashable {
    
    static func removeDuplicates(_ elements: [Element]) -> [Element] {
        var seen = Set<Element>()
        
        return elements.filter{ seen.insert($0).inserted }
    }
    
}
