//
//  Node.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

/// the node that represents a room
struct RoomNode: CustomStringConvertible {
    
    /// its true if the node was already visited during the path generation
    var wasVisited: Bool
    
    /// the relative positions of the exit rooms of this room
    var nextPositions: [RelativePositionEnum] = []
    
    var wasNeverVisted: Bool {
        return !wasVisited
    }
    
    var description: String {
        if wasVisited {
            return "⏹"
        } else {
            return "⬛️"
        }
    }
    
    init() {
        self.wasVisited = false
    }
}
