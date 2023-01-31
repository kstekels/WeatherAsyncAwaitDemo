//
//  Helpers.swift
//  Async Await tutorial
//
//  Created by karlis.stekels on 31/01/2023.
//

import Foundation

func parseJSON(_ weatherData: Data) -> WeatherModel? {
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
        let temp = decodedData.main.temp
        let name = decodedData.name
        let weather = WeatherModel(cityName: name, temperature: temp)
        return weather
    } catch {
        return nil
    }
}
