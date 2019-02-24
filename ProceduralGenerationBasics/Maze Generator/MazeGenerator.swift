//
//  Graph.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct MazeGenerator: ProceduralGeneratorProtocol {
    
    var graph: RoomGraph
    
    /// a stack that saves the last visited rooms during the generation of paths
    private var lastVisitedStack = Stack<GraphPosition>()
    
    init(withPlaceSize placeSize: GraphPosition) {
        self.graph = RoomGraph (
            withLinesCount: placeSize.line,
            andColsCount: placeSize.col,
            copiesFromNode: RoomNode()
        )
    }
    
    /// This code has the purpose of making paths between rooms of the graph.
    /// There are default vertices between the top, bottom, left and right positions of the rooms.
    /// The rooms must have only one entrance.
    /// The rooms can have multiply exists.
    /// There is a path between any two rooms
    mutating func generate() {
        lastVisitedStack.reset()
        
        /// inital position is randomic
        var currentPositon = (
            line: Int.random(in: 0..<graph.numberOfLines),
            col: Int.random(in: 0..<graph.numberOfCols)
        )
        
        lastVisitedStack.push(newElement: currentPositon)
        var thereAreUnvisitedRooms = true
        
        /// while there are unvisited rooms this loops continues
        while thereAreUnvisitedRooms {
            
            /// the current room is marked as visited
            graph[currentPositon.line, currentPositon.col].wasVisited = true
            let nextPossiblePositions = graph.relativePositionsNeverVisited(forPosition: currentPositon)
            
            /// one of the next possible positions is sorted
            if let nextPositionType = nextPossiblePositions.randomElement() {
                graph[currentPositon.line, currentPositon.col].nextPositions.append(nextPositionType)
                
                let nextPosition = nextPositionType.position(relativeTo: currentPositon)
              
                currentPositon = nextPosition
                lastVisitedStack.push(newElement: nextPosition)
                
            } else {
                
                /// if there is no more possible positions, a old room is used as pivot
                lastVisitedStack.discard()
                if let newBeginPositon = lastVisitedStack.pull() {
                    currentPositon = newBeginPositon
                } else {
                    
                    /// if there as are no more visited rooms in the stack, all the rooms where visited.
                    thereAreUnvisitedRooms = false
                }
            }
        }
    }
    
    /// Makes a Visual representation of the maze including walls
    ///
    /// - Returns: a array with this visual representation
    func placeDescription() -> [Array<Any>] {
        
        var mazeArray = Array.init(
            withNumberOfLines: graph.numberOfLines * 2 + 1,
            numberOfCols: graph.numberOfCols * 2 + 1,
            copiesFrom: "⬛️"
        )
        
        for lineIndex in (0..<graph.numberOfLines) {
            for colIndex in (0..<graph.numberOfCols) {
                
                mazeArray[(lineIndex * 2) + 1][(colIndex * 2) + 1] = graph[lineIndex, colIndex]
                
                for nextNode in graph[lineIndex, colIndex].nextPositions {
                    
                    let nextNodePosition = nextNode.position(relativeTo: (
                        line: (lineIndex * 2) + 1,
                        col: (colIndex * 2) + 1
                    ))
                    mazeArray[nextNodePosition.line][nextNodePosition.col] = nextNode
                }
            }
        }
        
        return mazeArray
    }
}
