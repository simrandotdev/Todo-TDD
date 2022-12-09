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
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
        sut.loadView()
    }
    
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func test_shouldBeSetup() {
        XCTAssertNotNil(sut)
    }
    
}
