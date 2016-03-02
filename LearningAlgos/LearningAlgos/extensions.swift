//
//  extensions.swift
//  LearningAlgos
//
//  Created by Saumitra Vaidya on 10/18/15.
//  Copyright © 2015 home. All rights reserved.
//

import Foundation

extension Int {
    
    //iterates the closure body a specified number of times
    func times(closure:(Int)->Void) {
        for i in 0...self {
            closure(i)
        }
    }
    
}
