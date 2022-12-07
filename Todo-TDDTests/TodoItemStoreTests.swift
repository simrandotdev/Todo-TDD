//
//  TodoItemStoreTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-11-23.
//

import XCTest
@testable import Todo_TDD

final class TodoItemStoreTests: XCTestCase {
    
    var sut: TodoItemStore!
    
    let STORE_NAME = "dummy_store"
    
    override func setUpWithError() throws {
        sut = TodoItemStore(fileName: STORE_NAME)
    }
    
    func test_add_ShouldPublishChange() throws {
        let sut = TodoItemStore(fileName: STORE_NAME)
        let todoItem = TodoItem(title: "Dummy Title")
        
        let receivedItems = try wait(for: sut.$itemPublisher, afterChange: {
            sut.add(todoItem)
        })
        
        XCTAssertEqual(receivedItems, [todoItem])
    }
    
    func test_check_shouldPublishChangeInDoneItems() throws {
        
        let todoItem = TodoItem(title: "Dummy")
        let todoItem2 = TodoItem(title: "Dummy 2")
        sut.add(todoItem)
        sut.add(todoItem2)
        
        let receivedItems = try wait(for: sut.$itemPublisher, afterChange: {
            sut.check(todoItem)
        })
        let doneItems = receivedItems.filter { $0.done }
        XCTAssertEqual(doneItems, [todoItem])
    }
    
    func test_init_shouldLoadPreviousTodoItems() {
        
        var sut1: TodoItemStore? = TodoItemStore(fileName: STORE_NAME)
        let publisherExpectation = expectation(description: "Wait for the publisher in \(#file)")
        
        let todoItem = TodoItem(title: "Dummy Title")
        sut1?.add(todoItem)
        
        sut1 = nil
        
        let sut2 = TodoItemStore(fileName: STORE_NAME)
        var result: [TodoItem]?
        
        let token = sut2.$itemPublisher
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(result, [todoItem])
    }
    
    func test_init_whenItemIsCheck_ShouldLoadPreviousTodoItems() throws {
        var sut1: TodoItemStore? = TodoItemStore(fileName: STORE_NAME)
        let publisherExpectation = expectation(description: "Wait for the publisher in \(#file)")
        
        // Create Items
        let item1 = TodoItem(title: "Item 1")
        let item2 = TodoItem(title: "Item 2")
        let item3 = TodoItem(title: "Item 3")
        
        // Add Items
        sut1?.add(item1)
        sut1?.add(item2)
        sut1?.add(item3)
        
        // Check Item
        sut1?.check(item1)
        
        // Unloading Item Store
        sut1 = nil
        
        // Loading Items again
        sut1 = TodoItemStore(fileName: STORE_NAME)
        var result: [TodoItem]?
        
        let token = sut1?.$itemPublisher
            .sink(receiveValue: { items in
                result = items
                publisherExpectation.fulfill()
            })
        
        wait(for: [publisherExpectation], timeout: 1)
        token?.cancel()
        XCTAssertEqual(result?[0].done, true)
        XCTAssertEqual(result?[1].done, false)
        XCTAssertEqual(result?[2].done, false)
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        let url = FileManager.default.documentURL(name: STORE_NAME)
        try? FileManager.default.removeItem(at: url)
    }
}
