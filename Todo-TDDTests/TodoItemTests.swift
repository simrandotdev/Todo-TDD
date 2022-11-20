//
//  Todo_TDDTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-11-20.
//

import XCTest
@testable import Todo_TDD

final class TodoItemTests: XCTestCase {

    func test_init_takesTitle() {
        let item = TodoItem(title: "Dummy")
        XCTAssertEqual(item.title, "Dummy", "title of the item should be 'Dummy'")
    }
    
    func test_init_takesTitleAndDescription() {
        let item = TodoItem(title: "Dummy Title", description: "Dummy Description")
        XCTAssertEqual(item.title, "Dummy Title", "title should be 'Dummy Title'")
        XCTAssertEqual(item.description, "Dummy Description", "description should be 'Dummy Description'")
    }

}
