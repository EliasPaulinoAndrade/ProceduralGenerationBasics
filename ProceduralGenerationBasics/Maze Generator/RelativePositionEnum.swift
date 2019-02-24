//
//  RelativePositionTypes.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

/// Represent a relative position of a roomnode
enum RelativePositionEnum: String, CustomStringConvertible {
    case top = "🔼", bottom = "🔽", left = "◀️", right = "▶️"
    
    var description: String {
        return self.rawValue
    }
    
    /// the absolute position leaving the paramenter position
    ///
    /// - Parameter position: the inital position
    /// - Returns: the position including the relative position
    func position(relativeTo position: GraphPosition) -> GraphPosition {
        switch self {
        case .top:
            return (position.line - 1, position.col)
        case .bottom:
            return (position.line + 1, position.col)
        case .left:
            return (position.line, position.col - 1)
        case .right:
            return (position.line, position.col + 1)
        }
    }
}
