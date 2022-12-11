//
//  TodoItemStoreProtocolMock.swift
//  Todo-TDDTests
//
//  Created by Simran Preet Narang on 2022-12-09.
//

import Foundation
import Combine
@testable import Todo_TDD


class TodoItemStoreProtocolMock: ToDoItemStoreProtocol {
    
    var itemPublisher = CurrentValueSubject<[TodoItem], Never>([])
    
    var checkLastCallArgument: TodoItem?
    func check(_ item: TodoItem) {
        checkLastCallArgument = item
    }
}
