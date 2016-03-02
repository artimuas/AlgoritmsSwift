//
//  Edge.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import Foundation

public class Edge {
    var weight: Int
    var neighbor: Vertex
    
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
}
