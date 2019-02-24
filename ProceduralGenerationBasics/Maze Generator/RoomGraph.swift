//
//  NodesStore.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

typealias GraphPosition = (line: Int, col: Int)

/// The graph is represented by a matrix of nodes.
/// The vertices are the visual sides of the node is the matrix.
/// All node has top, bottom, left and right possible vertices
struct RoomGraph {
    private var nodesArray = Array<Array<RoomNode>>()
    
    /// number of vertical positions of nodes in the graph
    private(set) var numberOfLines: Int
    
    /// number of horizontal positions of nodes in the graph
    private(set) var numberOfCols: Int
    
    subscript(line: Int, col: Int) -> RoomNode {
        set {
            nodesArray[line][col] = newValue
        } get {
            return nodesArray[line][col]
        }
    }
    
    /// initialize the graph with a number of lines and cols holding a node copy
    ///
    /// - Parameters:
    ///   - linesCount: number of lines
    ///   - colsCount: number of columns
    ///   - node: the node to copy
    init(withLinesCount linesCount: Int, andColsCount colsCount: Int, copiesFromNode node: RoomNode) {
        
        self.numberOfLines = linesCount
        self.numberOfCols = colsCount
        
        for _ in (0..<linesCount) {
            var line: [RoomNode] = []
            for _ in (0..<colsCount) {
                line.append(node)
            }
            nodesArray.append(line)
        }
    }
    
    /// The possible next positions leaving a node.
    /// It consider the existence of borders in the graph and visited rooms are not permitted
    ///
    /// - Parameter position: current node position
    /// - Returns: a array with relative positions leaving this node
    func relativePositionsNeverVisited(forPosition position: GraphPosition) -> [RelativePositionEnum] {
        var positions = Array<RelativePositionEnum>()
        
        if position.line < numberOfLines - 1, self[position.line + 1, position.col].wasNeverVisted {
            positions.append(.bottom)
        }
        
        if position.line > 0, self[position.line - 1, position.col].wasNeverVisted {
            positions.append(.top)
        }
        
        if position.col < numberOfCols - 1, self[position.line, position.col + 1].wasNeverVisted {
            positions.append(.right)
        }
        
        if position.col > 0, self[position.line, position.col - 1].wasNeverVisted {
            positions.append(.left)
        }
        
        return positions
    }
}
