//
//  Move.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation

class Move {
    
    var Name:String = ""
    var Time:Int = 45
    var Weight:Int = 0
    var Tags:[String] = [String]()
    var Removed = false
    
    init(name:String){
        Name = name
    }
    
    init(){
    }
    
    class func GenerateMoves() -> [Move]{
    
        var moves:[Move] = [Move]()
        
        return [
            
            Move(name: "Burpees"),
            Move(name: "Squats"),
            Move(name: "Bicep Curls"),
            Move(name: "Push-Ups"),
            Move(name: "Lunges"),
            Move(name: "Side Planks with Leg Raises"),
            Move(name: "Mountain Climbers"),
            Move(name: "Jabs")
            
            
        ]
    }
    
}
