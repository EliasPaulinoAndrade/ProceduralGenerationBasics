//
//  Graph.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct Graph {
    
    var nodesRepository =  NodesRepository(
        withLinesCount: 7,
        andColsCount: 7,
        copiesFromNode: Node()
    )
    
    var edgeRepository = EdgeRepository(forNumberOfNodes: 16)
    
    mutating func searchMainPath() {
        
        var currentPositon = (
            line: Int.random(in: 0..<nodesRepository.numberOfLines),
            col: Int.random(in: 0..<nodesRepository.numberOfCols)
        )
        
        while true {
            nodesRepository[currentPositon.line, currentPositon.col].wasVisited = true
            let nextPossiblePositions = nodesRepository.relativePositions(forPosition: currentPositon)
            
            if let nextPositionType = nextPossiblePositions.randomElement() {
                nodesRepository[currentPositon.line, currentPositon.col].nextNode = nextPositionType
                
                let nextPosition = nextPositionType.position(relativeTo: currentPositon)
                currentPositon = nextPosition
            } else {
                break
            }
        }
    }
}
