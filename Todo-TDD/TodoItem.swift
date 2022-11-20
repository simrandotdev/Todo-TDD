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
    
    init(title: String,
         description: String? = nil) {
        self.title = title
        self.description = description
    }
}
