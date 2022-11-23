//
//  TodoItemStoreTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-11-23.
//

import XCTest
@testable import Todo_TDD

final class TodoItemStoreTests: XCTestCase {
    
    func test_add_ShouldPublishChange() {
        let sut = TodoItemStore()
        let publisherExpectation = expectation(description: "Wait for publisher in \(#file)")
        var receivedItems: [TodoItem] = []
        let token = sut.$itemPublisher
            .dropFirst()
            .sink { items in
                receivedItems = items
                publisherExpectation.fulfill()
            }
        
        let todoItem = TodoItem(title: "Dummy Title")
        sut.add(todoItem)
        
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(receivedItems, [todoItem])
    }
}
