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
    
    func check(_ item: TodoItem) {
        
        var mutableItem = item
        mutableItem.done = true
        
        if let index = itemPublisher.firstIndex(of: item) {
            itemPublisher[index] = mutableItem
        }
    }
}
