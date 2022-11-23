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
    
    override func setUpWithError() throws {
        sut = TodoItemStore()
    }
    
    func test_add_ShouldPublishChange() throws {
        let sut = TodoItemStore()
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
    
    override func tearDownWithError() throws {
        sut = nil
    }
}
