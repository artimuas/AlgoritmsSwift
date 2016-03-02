//
//  SwiftGraph.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import Foundation

public class SwiftGraph {
    
    private var canvas: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    func addVertex(key: String) -> Vertex {
        
        let childVertex: Vertex = Vertex()
        childVertex.key = key
        
        canvas.append(childVertex)
        
        return childVertex
    }
    
    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        
        let newEdge = Edge()
        
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        if isDirected == false {
            let reverseEdge = Edge()
            
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
    }
    
    func processDijkstras(source: Vertex, destination: Vertex) -> Path? {
        
        var frontier: Array<Path> = Array<Path>()
        var finalPaths: Array<Path> = Array<Path>()
        
        for n in source.neighbors {
            
            let newPath = Path()
            
            newPath.destination = n.neighbor
            newPath.previous = nil
            newPath.total = n.weight
            
            frontier.append(newPath)
        }
        
        var bestPath: Path
        
        
        while frontier.count != 0 {
            
            //support path changes using the greedy approach
            bestPath = Path()
            var pathIndex: Int = 0
            
            
            for x in 0..<frontier.count {
                
                let itemPath: Path = frontier[x]
                
                if  (bestPath.total == nil) || (itemPath.total < bestPath.total) {
                    bestPath = itemPath
                    pathIndex = x
                }
                
            }
            
            
            
            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {
                
                let newPath: Path = Path()
                
                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                
                //add the new path to the frontier
                frontier.append(newPath)
                
            }
            
            
            //preserve the bestPath
            finalPaths.append(bestPath)
            
            
            //remove the bestPath from the frontier
            frontier.removeAtIndex(pathIndex)
            
            
        } //end while
        
        
        
        //establish the shortest path as an optional
        var shortestPath: Path! = Path()
        
        
        for itemPath in finalPaths {
            
            if (itemPath.destination.key == destination.key) {
                
                if  (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
                    shortestPath = itemPath
                }
                
            }
            
        }
        
        return shortestPath
    }
}