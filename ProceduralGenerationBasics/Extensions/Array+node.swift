//
//  Array+node.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

extension Array where Element == Array<Any> {
    init(withNumberOfLines numberOfLines: Int, numberOfCols: Int, copiesFrom object: Any) {
        self.init()
        
        for _ in (0..<numberOfLines) {
            var line = Array<Any>()
            for _ in (0..<numberOfCols) {
                line.append(object)
            }
            append(line)
        }
    }
}
