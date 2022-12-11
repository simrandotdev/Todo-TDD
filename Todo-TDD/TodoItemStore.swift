//
//  TodoItemStore.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-11-23.
//

import Foundation
import Combine

protocol ToDoItemStoreProtocol {
    var itemPublisher: CurrentValueSubject<[TodoItem], Never> { get set }
    
    func check(_: TodoItem)
}

class TodoItemStore: ToDoItemStoreProtocol {
    
    var itemPublisher = CurrentValueSubject<[TodoItem], Never>([])
    
    private var items: [TodoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    private let fileName: String
    
    init(fileName: String = "todoitems") {
        self.fileName = fileName
        loadItems()
    }
    
    func add(_ item: TodoItem) {
        items.append(item)
        saveItems()
    }
    
    func check(_ item: TodoItem) {
        var mutableItem = item
        mutableItem.done = true
        if let index = items.firstIndex(of: item) {
            items[index] = mutableItem
            saveItems()
        }
    }
    
    private func saveItems() {
        let url = FileManager.default
            .documentURL(name: fileName)
        
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        } catch {
            print("error: \(error)")
        }
    }
    
    private func loadItems() {
        let url = FileManager.default
            .documentURL(name: fileName)
        
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder()
                .decode([TodoItem].self, from: data)
        } catch {
            print("error: \(error)")
        }
    }
}
