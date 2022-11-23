//
//  TodoItem.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-11-20.
//

import Foundation

struct TodoItem: Equatable {

    let id: UUID
    var title: String
    var description: String?
    var timestamp: TimeInterval?
    var location: Location?
    var done: Bool = false
    
    init(title: String,
         description: String? = nil,
         timestamp: TimeInterval? = nil,
         location: Location? = nil) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }
    
    // MARK: Equatable
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.title == rhs.title
        && lhs.description == rhs.description
        && lhs.timestamp == rhs.timestamp
        && lhs.location == rhs.location
        && lhs.id == rhs.id
    }
}
