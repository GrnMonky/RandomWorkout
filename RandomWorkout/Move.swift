//
//  Move.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation

struct Move {
    
    var Name:String = ""
    var Time:Int = 45
    var Tags:[String] = [String]()
    
    static func GenerateMoves() -> [Move]{
    
        var moves:[Move] = [Move]()
        
        return moves
    }
}
