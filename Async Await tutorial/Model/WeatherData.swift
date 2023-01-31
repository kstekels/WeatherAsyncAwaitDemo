//
//  WeatherData.swift
//  Async Await tutorial
//
//  Created by karlis.stekels on 31/01/2023.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
