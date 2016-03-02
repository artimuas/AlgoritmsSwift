//
//  Path.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import Foundation

public class Path {
    
    var total: Int!
    var destination: Vertex
    var previous: Path!
    
    init() {
        destination = Vertex()
    }
}