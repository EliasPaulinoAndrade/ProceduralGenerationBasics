//
//  Node.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct Node: CustomStringConvertible {
    
    var wasVisited: Bool
    var nextNode: RelativePositionTypes?
    
    var wasNeverVisted: Bool {
        return !wasVisited
    }
    
    var description: String {
        if let nextNode = self.nextNode {
            return "[\(wasVisited ? "V" : "N")\t\(nextNode)]"
        } else {
            return "[\(wasVisited ? "V" : "N")\t-]"
        }
    }
    
    init() {
        self.wasVisited = false
    }
}
