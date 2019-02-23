//
//  ViewController.swift
//  ProceduralGenerationBasics
//
//  Created by Elias Paulino on 23/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var graph = Graph()
    var maze: [[Any]]?
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        graph.searchMainPath()
        collection.reloadData()
        print(graph.nodesRepository)
        //print(graph.nodesRepository.toMazeFormat())
        
        for item in graph.nodesRepository.toMazeFormat() {
            for subItem in item {
                print(subItem, terminator: "")
            }
            print()
        }
        
        self.maze = graph.nodesRepository.toMazeFormat()
        self.collection.reloadData()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let lines = maze?.count, let cols = maze?.first?.count {
            return lines * cols
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
//        let line = indexPath.row / graph.nodesRepository.numberOfCols
//        let col = indexPath.row - line*graph.nodesRepository.numberOfLines
        
        guard let lines = maze?.count, let cols = maze?.first?.count else {
            return cell
        }

        let line = indexPath.row / cols
        let col = indexPath.row - line*lines
        
        if let item = maze?[line][col] as? String {
            if item == "#" {
                cell.backgroundColor = UIColor.black
            } else {
                cell.backgroundColor = UIColor.white
            }
        }
        
//        let node = graph.nodesRepository[line, col]
        
//        if node.wasVisited {
//            cell.backgroundColor = UIColor.red
//            if let nextNode = node.nextNode {
//                switch nextNode {
//
//                case .bottom:
//                    let view = UIView.init()
//                    view.backgroundColor = UIColor.blue
//                    cell.addSubview(view)
//
//                    view.translatesAutoresizingMaskIntoConstraints = false
//
//                    view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
//                    view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
//                    view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
//                    view.heightAnchor.constraint(equalToConstant: 10).isActive = true
//                case .top:
//                    let view = UIView.init()
//                    view.backgroundColor = UIColor.blue
//                    cell.addSubview(view)
//
//                    view.translatesAutoresizingMaskIntoConstraints = false
//
//                    view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
//                    view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
//                    view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
//                    view.heightAnchor.constraint(equalToConstant: 10).isActive = true
//
//                case .left:
//                    let view = UIView.init()
//                    view.backgroundColor = UIColor.blue
//                    cell.addSubview(view)
//
//                    view.translatesAutoresizingMaskIntoConstraints = false
//
//                    view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
//                    view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
//                    view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
//                    view.widthAnchor.constraint(equalToConstant: 10).isActive = true
//
//                case .right:
//                    let view = UIView.init()
//                    view.backgroundColor = UIColor.blue
//                    cell.addSubview(view)
//
//                    view.translatesAutoresizingMaskIntoConstraints = false
//
//                    view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
//                    view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
//                    view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
//                    view.widthAnchor.constraint(equalToConstant: 10).isActive = true
//
//                }
//            }
//        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let mazeLine = maze?.count {
            let lineCount = collectionView.bounds.width/CGFloat(mazeLine + 5)
            
            return CGSize.init(width: lineCount, height: lineCount)
        }
        
        return CGSize.init(width: 0, height: 0)
    }
}
