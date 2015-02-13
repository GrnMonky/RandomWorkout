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
            Move(name: "Walking Push-Ups"),
            Move(name: "Lunge kick"),
            Move(name: "Side Planks with Leg Raises"),
            Move(name: "Mountain Climbers"),
            Move(name: "Jabs"),
            Move(name: "lunges"),
            Move(name: "Push-Up"),
            Move(name: "Plank Knee Tuck"),
            Move(name: "Shuffle"),
            Move(name: "Kicks"),
            Move(name: "In and Out abs plank"),
            Move(name: "Twist Knee Up"),
            Move(name: "Tricep dips"),
            Move(name: "Monkey Press"),
            Move(name: "Uppercuts"),
            Move(name: "Mason Twists"),
            Move(name: "C sit abs"),
            Move(name: "Dumbbell swings"),
            Move(name: "Tricep Kickback"),
            Move(name: "Bent over rows"),
            Move(name: "Sun Salutation"),
            Move(name: "bicycle kicks")
        ]
    }
    
}
