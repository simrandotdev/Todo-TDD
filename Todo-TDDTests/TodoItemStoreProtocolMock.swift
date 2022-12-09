//
//  TodoItemStoreProtocolMock.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-12-09.
//

import Foundation
import Combine
@testable import Todo_TDD


class TodoItemStoreProtocolMock: TodoItemStoreProtocol {
    
    @Published var itemPublisher: [Todo_TDD.TodoItem] = []
    
    var checkLastCallArgument: TodoItem?
    
    func add(_ todoItem: Todo_TDD.TodoItem) {
        
    }
    
    func check(_ item: Todo_TDD.TodoItem) {
        checkLastCallArgument = item
    }
}
