//
//  ViewController.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var generator = MazeGenerator(withMazeSize: (line: 10, col: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        generator.generatePaths()
        
        print(generator.toMazeFormat().reduce("", { (currentValue, line) -> String in
            return currentValue + line.reduce("", { (currentLineValue, item) -> String in
                return "\(currentLineValue)\(item)"
            }).appending("\n")
        }))
    }
}
