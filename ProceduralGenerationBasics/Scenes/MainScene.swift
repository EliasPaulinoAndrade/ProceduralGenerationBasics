//
//  MainScene.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit
import SpriteKit

class MainScene: SKScene {
    
    var generator: MazeGenerator = MazeGenerator(withPlaceSize: (line: 5, col: 5))
    
    override func didMove(to view: SKView) {
        
        generator.generate()
        
        print(generator.placeDescription().reduce("", { (currentValue, line) -> String in
            return currentValue + line.reduce("", { (currentLineValue, item) -> String in
                return "\(currentLineValue)\(item)"
            }).appending("\n")
        }))
        
        let yStrideStep = Constants.room.height + Constants.Hall.width
        let xStrideStep = Constants.room.width + Constants.Hall.width
        
        for y in (0..<Constants.numberOfRooms) {
            for x in (0..<Constants.numberOfRooms) {
                
                let position = CGPoint.init(
                    x: (-frame.width/2 + Constants.Hall.width) + (CGFloat(x) * xStrideStep),
                    y: (frame.height/2 - yStrideStep) - (CGFloat(y) * yStrideStep)
                )
                
                let roomNode = createRoom(atPosition: position)
                //let node = generator.graph[y, x]
                
                addChild(roomNode)
                
            }
        }
    }
    
    func createRoom(atPosition position: CGPoint) -> SKShapeNode {
        let roomSize = CGSize.init(width: Constants.room.width, height: Constants.room.height)
        let roomFrame = CGRect.init(origin: position, size: roomSize)
        let room = SKShapeNode.init(rect: roomFrame)
        
        room.fillColor = UIColor.purple
        
        return room
    }
}

private enum Constants {
    static let numberOfRooms = 5
    enum room {
        static let width: CGFloat = 130
        static let height: CGFloat = 70
    }
    enum Hall {
        static let width: CGFloat = 20
    }
}
