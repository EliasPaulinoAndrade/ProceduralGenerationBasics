//
//  EdgesRepository.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct EdgeRepository: CustomStringConvertible {
    
    var edgesArray = Array<Array<Bool>>()
    
    var description: String {
        var descriptionString = ""
        for line in edgesArray {
            for edge in line {
                descriptionString += "\(edge) "
            }
            descriptionString += "\n"
        }
        return descriptionString
    }
    
    init(forNumberOfNodes numberOfNodes: Int) {
        for _ in (0..<numberOfNodes) {
            var line = Array<Bool>()
            for _ in (0..<numberOfNodes) {
                line.append(false)
            }
            edgesArray.append(line)
        }
    }
    
    mutating func addEdge(fromNodeWithIndex fNodeIndex: Int, toNodeWithIndex sNodeIndex: Int) {
        edgesArray[fNodeIndex][sNodeIndex] = true
        edgesArray[sNodeIndex][fNodeIndex] = true
    }
}
