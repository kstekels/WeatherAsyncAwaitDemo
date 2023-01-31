//
//  MockWeatherService.swift
//  Async Await tutorialTests
//
//  Created by karlis.stekels on 31/01/2023.
//

import Foundation
@testable import Async_Await_tutorial

final class MockWeatherService: WeatherServiceProtocol {
    
    var returnResult: Double = 0.0
    
    func asyncCall(for cityId: String) async -> Double {
        return returnResult
    }
}
