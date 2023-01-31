//
//  AsyncViewModel.swift
//  Async Await tutorial
//
//  Created by karlis.stekels on 31/01/2023.
//

import Foundation

class AsyncViewModel: ObservableObject {
    
    @Published var temp = 0.0
    
    @MainActor
    func executeSearch(for cityId: String) async -> Double {
        temp = await asyncCall(for: cityId)
        return temp
    }
    
    
    func asyncCall(for cityId: String) async -> Double {
        
        //TODO: Add you API key from to environment variables with name "API_KEY" -> "https://home.openweathermap.org/api_keys"
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
            return 0.0
        }
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityId)&appid=\(apiKey)&units=metric") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return -1
            }
            if let weather = parseJSON(data) {
                return weather.temperature
            }
        } catch {
            return -1
        }
        
        return 0.0
    }
}
