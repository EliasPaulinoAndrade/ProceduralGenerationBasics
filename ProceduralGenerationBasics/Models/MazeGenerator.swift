//
//  Graph.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct MazeGenerator {
    
    var nodesRepository =  RoomGraph(
        withLinesCount: 5,
        andColsCount: 5,
        copiesFromNode: RoomNode()
    )
    
    var lastVisitedStack = Stack<(line: Int, col: Int)>()
    
    mutating func searchMainPath() {
        
        var currentPositon = (
            line: Int.random(in: 0..<nodesRepository.numberOfLines),
            col: Int.random(in: 0..<nodesRepository.numberOfCols)
        )
        
        lastVisitedStack.push(newElement: currentPositon)
        
        while true {
            nodesRepository[currentPositon.line, currentPositon.col].wasVisited = true
            let nextPossiblePositions = nodesRepository.relativePositionsNeverVisited(forPosition: currentPositon)
            
            if let nextPositionType = nextPossiblePositions.randomElement() {
                nodesRepository[currentPositon.line, currentPositon.col].nextNodes.append(nextPositionType)
                
                let nextPosition = nextPositionType.position(relativeTo: currentPositon)
              
                currentPositon = nextPosition
                lastVisitedStack.push(newElement: nextPosition)
                
            } else {
                lastVisitedStack.discard()
                if let newBeginPositon = lastVisitedStack.pull() {
                    currentPositon = newBeginPositon
                } else {
                    break
                }
            }
        }
    }
}
