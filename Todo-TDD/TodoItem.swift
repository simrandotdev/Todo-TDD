//
//  TodoItem.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-11-20.
//

import Foundation

struct TodoItem {
    
    var title: String
    var description: String?
    var timestamp: TimeInterval?
    
    init(title: String,
         description: String? = nil,
         timestamp: TimeInterval? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
    }
}
