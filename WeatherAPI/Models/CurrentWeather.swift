//
//  CurrentWeather.swift
//  WeatherAPI
//
//  Created by kraujalis.rolandas on 10/11/2023.
//

import Foundation

struct CurrentWeather: Codable {
    let location: Location
    let current: Current
}
