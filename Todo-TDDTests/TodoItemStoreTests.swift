//
//  TodoItemStoreTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-11-23.
//

import XCTest
@testable import Todo_TDD

final class TodoItemStoreTests: XCTestCase {
    
    func test_add_ShouldPublishChange() throws {
        let sut = TodoItemStore()
        let todoItem = TodoItem(title: "Dummy Title")
        
        let receivedItems = try wait(for: sut.$itemPublisher, afterChange: {
            sut.add(todoItem)
        })
        
        XCTAssertEqual(receivedItems, [todoItem])
    }
}
