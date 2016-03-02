//
//  PathHeap.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import Foundation

public class PathHeap {
    
    private var heap: Array<Path>
    
    init() {
        heap = Array<Path>()
    }
    
    
    //the number of frontier items
    var count: Int {
        return self.heap.count
    }
    
    
    
    //obtain the minimum path
    func peek() -> Path! {
        
        if (heap.count > 0) {
            return heap[0] //the shortest path
        }
        else {
            return nil
        }
    }
    
    
    
    //remove the minimum path
    func deQueue() {
        
        if (heap.count > 0) {
            heap.removeAtIndex(0)
        }
        
    }
    
    
    //sort shortest paths into a min-heap (heapify)
    func enQueue(key: Path) {
        
        
        heap.append(key)
        
        
        var childIndex: Float = Float(heap.count) - 1
        var parentIndex: Int! = 0
        
        
        //calculate parent index
        if (childIndex != 0) {
            parentIndex = Int(floorf((childIndex - 1) / 2))
        }
        
        
        var childToUse: Path
        var parentToUse: Path
        
        
        //use the bottom-up approach
        while childIndex != 0 {
            
            
            childToUse = heap[Int(childIndex)]
            parentToUse = heap[parentIndex]
            
            
            //swap child and parent positions
            if childToUse.total < parentToUse.total {
                swap(&heap[parentIndex], &heap[Int(childIndex)])
            }
            
            
            //reset indices
            childIndex = Float(parentIndex)
            
            
            if (childIndex != 0) {
                parentIndex = Int(floorf((childIndex - 1) / 2))
            }
            
            
        } //end while
        
        
    } //end function
    
    
    
}