//
//  RelativePositionTypes.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

enum RelativePositionTypes: String, CustomStringConvertible {
    case top
    case bottom
    case left
    case right
    
    var description: String {
        switch self {
        case .top:
            return "ˆ"
        case .bottom:
            return "v"
        case .left:
            return "<"
        case .right:
            return ">"
        }
    }
    
    func position(relativeTo position: (line: Int, col: Int)) -> (line: Int, col: Int) {
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
