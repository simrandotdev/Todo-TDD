//
//  LocationTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-11-21.
//

import XCTest
@testable import Todo_TDD
import CoreLocation

final class LocationTests: XCTestCase {

    func test_init_setsName() {
        let location = Location(name: "Dummy Location Name")
        
        XCTAssertEqual(location.name, "Dummy Location Name")
    }
    
    func test_init_setsCoordinate() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Dummy Location Name", coordinate: coordinate)
        
        let resultsCoordinate = try XCTUnwrap(location.coordinate)
        XCTAssertEqual(resultsCoordinate.latitude, 1, accuracy: 0.000_001)
        XCTAssertEqual(resultsCoordinate.longitude, 2, accuracy: 0.000_001)
    }

}
