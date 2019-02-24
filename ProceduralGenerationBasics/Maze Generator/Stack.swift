//
//  Stack.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct Stack<Element> {
    private var list = Array<Element>()
    
    /// add a new element to the stack
    ///
    /// - Parameter newElement: the element to add
    mutating func push(newElement: Element) {
        list.append(newElement)
    }
    
    /// remove the stacks head and return it
    ///
    /// - Returns: the stack head
    mutating func pull() -> Element? {
        if list.count > 0 {
            return list.removeLast()
        }
        return nil
    }
    
    /// discards the head element
    mutating func discard() {
        if list.count > 0 {
            list.removeLast()
        }
    }
    
    /// erase all the stack
    mutating func reset() {
        list = Array<Element>()
    }
}
