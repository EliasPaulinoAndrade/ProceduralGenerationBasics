//
//  Stack.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct Stack<Element> {
    var list = Array<Element>()
    
    mutating func push(newElement: Element) {
        list.append(newElement)
    }
    
    mutating func pull() -> Element? {
        if list.count > 0 {
            return list.removeLast()
        }
        return nil
    }
    
    mutating func discard() {
        if list.count > 0 {
            list.removeLast()
        }
    }
    
    mutating func reset() {
        list = Array<Element>()
    }
}
