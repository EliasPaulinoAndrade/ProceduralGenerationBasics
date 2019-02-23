//
//  ViewController.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        var graph = Graph()
        
        graph.searchMainPath()
        
        print(graph.nodesRepository)
        
        print()

//        graph.nodesRepository[1, 2].wasVisited = true
//        graph.nodesRepository[2, 1].wasVisited = true
//
//        graph.nodesRepository[1, 0].wasVisited = true
//        graph.nodesRepository[0, 1].wasVisited = true

//        print(graph.nodesRepository.relativePositions(forPosition: (line: 1, col: 1)))
    }
}

