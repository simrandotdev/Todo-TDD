//
//  TodoItemStore.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-11-23.
//

import Foundation
import Combine

class TodoItemStore {
    
    @Published var itemPublisher: [TodoItem] = []
    
    func add(_ todoItem: TodoItem) {
        
        itemPublisher.append(todoItem)
    }
}
