//
//  ViewController.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testGraph: SwiftGraph = SwiftGraph()

        /* build the vertices */
        
        let vertexA = testGraph.addVertex("A")
        let vertexB = testGraph.addVertex("B")
        let vertexC = testGraph.addVertex("C")
        let vertexD = testGraph.addVertex("D")
        let vertexE = testGraph.addVertex("E")
        
        
        /* connect the vertices with weighted edges */
        
        testGraph.addEdge(vertexA, neighbor: vertexD, weight: 4)
        testGraph.addEdge(vertexA, neighbor: vertexB, weight: 1)
        testGraph.addEdge(vertexB, neighbor: vertexD, weight: 5)
        testGraph.addEdge(vertexB, neighbor: vertexC, weight: 2)
        testGraph.addEdge(vertexD, neighbor: vertexE, weight: 8)
        
        testGraph.processDijkstras(vertexA, destination: vertexE)
        
        let numberList = [1, 19, 0, -1, 8]
        
        mergeSort(numberList)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func mergeSort(input:[Int]) -> [Int] {
        
        //establish the base case
        if (input.count <= 1) {
            return input
        }
        
        //find the mid point of the input and move them into two buckets
        let mid = Int(floor(Double(input.count / 2)))
        let left = Array(input[0..<mid])
        let right = Array(input[mid..<input.count])
        
        
        //recursive call here to continue to divide each side
        let leftSide = mergeSort(left)
        let rightSide = mergeSort(right)
        
        //conquer for each method invocation
        return sortForMergeSort(leftSide, right: rightSide)
    }
    
    
    func sortForMergeSort(left:[Int], right:[Int]) -> [Int] {
        
        //create a new array to place our sorted numbers
        var sortedArray:[Int] = []
        var leftCount = 0
        var rightCount = 0
        
        /*
        var someCount: Int = left.count + right.count
        
        for i in 0...someCount {
        println(i)
        }
        */
        
        
        // For all of the numbers on both sides
        (left.count + right.count).times { i in
            
            /*
            if we've exhausted the right side, or if we still have some to use on
            the left side and the current left side number is smaller in value than the
            right sides current value, then add the left numbers value to the sorted array
            */
            
            if (leftCount < left.count && (rightCount >= right.count || left[leftCount] <= right[rightCount])) {
                sortedArray.append(left[leftCount++])
            } else if (rightCount < right.count && (leftCount >= left.count || right[rightCount] < left[leftCount])) {
                sortedArray.append(right[rightCount++])
            }
        }
        
        return sortedArray
    }
    
}

