//
//  Location.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-11-21.
//

import Foundation
import CoreLocation

struct Location: Equatable {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
    
    // MARK: Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name
        && lhs.coordinate?.latitude == rhs.coordinate?.latitude
        && lhs.coordinate?.longitude == rhs.coordinate?.longitude
    }
}
