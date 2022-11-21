//
//  Todo_TDDTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-11-20.
//

import XCTest
@testable import Todo_TDD

final class TodoItemTests: XCTestCase {

    func test_init_takesAndSetsTitle() {
        let item = TodoItem(title: "Dummy")
        XCTAssertEqual(item.title, "Dummy", "title of the item should be 'Dummy'")
    }
    
    func test_init_takesAndSetTitleAndDescription() {
        let item = TodoItem(title: "Dummy Title", description: "Dummy Description")
        XCTAssertEqual(item.title, "Dummy Title", "title should be 'Dummy Title'")
        XCTAssertEqual(item.description, "Dummy Description", "description should be 'Dummy Description'")
    }
    
    func test_init_takesAndSetTimeStamp() throws {
        let dummyTimestamp: TimeInterval = 42.0
        let item = TodoItem(title: "Dummy Title", timestamp: dummyTimestamp)
        
        XCTAssertEqual(item.title, "Dummy Title", "title should be 'Dummy Title'")
        
        let timestamp = try XCTUnwrap(item.timestamp)
        XCTAssertEqual(item.timestamp!,
                       timestamp,
                       accuracy: 0.00_001,
                       "timestamp should be '\(dummyTimestamp)'")
    }
    
    func test_init_whenGivenLocation_setsLocation() {
        
        let dummyLocation = Location(name: "Dummy Location Name")
        let item = TodoItem(title: "Dummy Title", location: dummyLocation)
        XCTAssertNotNil(item.location)
    }
    
    func test_todoItem_isEqutable() {
        
        let item1 = TodoItem(title: "Title",
                             description: "Description",
                             timestamp: 42,
                             location: .init(name: "Location"))
        let item2 = TodoItem(title: "Title",
                             description: "Description",
                             timestamp: 42,
                             location: .init(name: "Location"))
        XCTAssertEqual(item1, item2)
    }

}
