//
//  TodoItemStore.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-11-23.
//

import Foundation
import Combine

protocol TodoItemStoreProtocol {
    
    var itemPublisher: [TodoItem] { get set }
    
    func add(_ todoItem: TodoItem)
    func check(_ item: TodoItem)
}

class TodoItemStore: TodoItemStoreProtocol {
    
    @Published var itemPublisher: [TodoItem] = []
    
    private let fileName: String
    
    init(fileName: String = "todoItems") {
        self.fileName = fileName
        loadItems()
    }
    
    func add(_ todoItem: TodoItem) {
        
        itemPublisher.append(todoItem)
        saveItems()
    }
    
    func check(_ item: TodoItem) {
        
        var mutableItem = item
        mutableItem.done = true
        
        if let index = itemPublisher.firstIndex(of: item) {
            itemPublisher[index] = mutableItem
        }
        
        saveItems()
    }
    
    // MARK: Private Methods
    private func saveItems() {
        let url = FileManager.default.documentURL(name: fileName)
        do {
            let data = try JSONEncoder().encode(itemPublisher)
            try data.write(to: url)
        } catch {
            print("❌ Error in \(#function) ", error)
        }
    }
    
    private func loadItems() {
        let url = FileManager.default.documentURL(name: fileName)
        do {
            let data = try Data(contentsOf: url)
            itemPublisher = try JSONDecoder().decode([TodoItem].self, from: data)
        } catch {
            print("❌ Error in \(#function) ", error)
        }
    }
}
