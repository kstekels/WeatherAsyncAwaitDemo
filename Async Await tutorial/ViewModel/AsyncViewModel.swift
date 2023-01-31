//
//  AsyncViewModel.swift
//  Async Await tutorial
//
//  Created by karlis.stekels on 31/01/2023.
//

import Foundation

class AsyncViewModel: ObservableObject {
    
    @Published var temp: Double = 0.0
    private var weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    @MainActor
    func executeSearch(for cityId: String) async -> Double {
        temp = await weatherService.asyncCall(for: cityId)
        return temp
    }
}
