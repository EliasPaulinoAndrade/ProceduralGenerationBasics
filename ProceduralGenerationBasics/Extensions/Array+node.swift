//
//  Array+node.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

extension Array where Element == Any {
    init(with numberOfCopies: Int, copiesFrom object: Any) {
        self.init()
        
        let copies = (0..<numberOfCopies).map { (_) -> Any in
            return object
        }
        
        append(contentsOf: copies)
    }
}
