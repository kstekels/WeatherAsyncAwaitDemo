//
//  TestVM.swift
//  Async Await tutorialTests
//
//  Created by karlis.stekels on 31/01/2023.
//

import XCTest
@testable import Async_Await_tutorial

final class TestVM: XCTestCase {
    
    var vm: AsyncViewModel!
    var mockWeatherService: MockWeatherService!
    
    override func setUpWithError() throws {
        mockWeatherService = MockWeatherService()
        vm = .init(weatherService: mockWeatherService)
    }
    
    override func tearDownWithError() throws {
        mockWeatherService = nil
        vm = nil
    }
    
    //TODO: Test case
    func testForCityToReturnPositiveTemperature() async {
        mockWeatherService.returnResult = 3.5
        let temp = await vm.executeSearch(for: "Riga")
        XCTAssertEqual(temp, 3.5)
    }
    
    
    deinit {
        vm = nil
    }
    
}
