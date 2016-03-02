//
//  Vertex.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import Foundation

public class Vertex {
    var key: String?
    var neighbors: Array<Edge>
    
    init() {
        self.neighbors = Array<Edge>()
    }
}
