//
//  JSONFetchTest.swift
//  Async Await tutorialTests
//
//  Created by karlis.stekels on 31/01/2023.
//

import XCTest
@testable import Async_Await_tutorial

final class JSONFetchTest: XCTestCase {
    var sut: Data!
    var weatherModel: WeatherModel!
    
    override func setUpWithError() throws {
        sut =
            """
            {
                "coord": {
                    "lon": 24.0833,
                    "lat": 57
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04d"
                    }
                ],
                "base": "stations",
                "main": {
                    "temp": 3.21,
                    "feels_like": 1.22,
                    "temp_min": 2.18,
                    "temp_max": 3.35,
                    "pressure": 997,
                    "humidity": 76
                },
                "visibility": 10000,
                "wind": {
                    "speed": 2.06,
                    "deg": 250
                },
                "clouds": {
                    "all": 75
                },
                "dt": 1675164142,
                "sys": {
                    "type": 2,
                    "id": 2075320,
                    "country": "LV",
                    "sunrise": 1675146347,
                    "sunset": 1675176489
                },
                "timezone": 7200,
                "id": 456173,
                "name": "Rīga",
                "cod": 200
            }
            """.data(using: .utf8)!
        
        weatherModel = WeatherModel(cityName: "Rīga", temperature: 3.21)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        weatherModel = nil
    }
    
    func testJsonForNil() {
        XCTAssertNil(parseJSON("".data(using: .utf8)!))
    }
    
    func testJsonForDataNotNil() {
        XCTAssertNotNil(parseJSON(sut))
    }
    
    func testJsonForResultForCityRiga() {
        XCTAssertEqual(parseJSON(sut), weatherModel)
    }
    
    deinit {
        sut = nil
        weatherModel = nil
    }
    
}
