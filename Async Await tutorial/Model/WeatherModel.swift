//
//  WeatherModel.swift
//  Async Await tutorial
//
//  Created by karlis.stekels on 31/01/2023.
//

import Foundation


struct WeatherModel {
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
}
