//
//  ToDoItemsListViewControllerTests.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-12-09.
//

import XCTest
@testable import Todo_TDD

final class ToDoItemsListViewControllerTests: XCTestCase {
    
    var sut: ToDoItemsListViewController!
    var todoItemsStoreMock: TodoItemStoreProtocolMock!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
        todoItemsStoreMock = TodoItemStoreProtocolMock()
        sut.todoItemStore = todoItemsStoreMock
        sut.loadViewIfNeeded()
    }
    
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func test_shouldBeSetup() {
        XCTAssertNotNil(sut)
    }
    
    
    func test_shouldHaveTableVIew() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
    }
    
    func test_numberOfRows_whenOneItemIsSent_shouldReturnOne() {

        todoItemsStoreMock.itemPublisher.send([TodoItem(title: "title 1")])
        let results = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(results, 1)
    }

    func test_numberOfRows_whenTwoItemsAreSent_shouldReturnTwo() {

        todoItemsStoreMock.itemPublisher.send([TodoItem(title: "dummy 1"), TodoItem(title: "dummy 2")])

        let results = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(results, 2)
    }
}
