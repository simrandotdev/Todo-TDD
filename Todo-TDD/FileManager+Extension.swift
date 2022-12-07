//
//  FileManager+Extension.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-12-07.
//

import Foundation

extension FileManager {
    
    func documentURL(name: String) -> URL {
        guard let documentURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Could not find document URL in Document Directory for User Domain Mask")
        }
        
        return documentURL.appending(component: name)
    }
}
