//
//  ProceduralGenerator.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

/// Describes how a place procedural generator
protocol ProceduralGeneratorProtocol {
    
    init(withPlaceSize placeSize: GraphPosition)
    mutating func generate()
    func placeDescription() -> [Array<Any>]
}
