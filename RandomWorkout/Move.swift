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
    var Time:Int = 30
    var Weight:Int = 0
    var Tags:[String] = [String]()
    var Removed = false
    
    init(name:String){
        Name = name
    }
    
    init(){
    }
    
    
    //Generates Moves
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
            Move(name: "Lunges"),
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
            Move(name: "Bicycle kicks"),
            Move(name: "Superman"),
            Move(name: "Scissor kicks"),
            Move(name: "Shoulder push-ups"),
            Move(name: "Dive bomber push-ups"),
            Move(name: "Warrior"),
            Move(name: "Half moon"),
            Move(name: "Ab Tucks"),
            Move(name: "Jack push-up"),
            Move(name: "Spider-Man pushup"),
            Move(name: "Side plank hip dips"),
            Move(name: "Hip-hop Kicks"),
            Move(name: "Squatting shuffle"),
            Move(name: "Staggered pushup"),
            Move(name: "Calf raises"),
            Move(name: "Side kicks"),
            Move(name: "Tricep ball push-ups"),
            Move(name: "Twisting half moon"),
            Move(name: "Power knee"),
            Move(name: "Swimmer"),
            Move(name: "Skaters"),
            Move(name: "Tricep curls"),
            Move(name: "Military march"),
            Move(name: "Up and over knee"),
            Move(name: "Twisting Warrior"),
            Move(name: "Chair"),
            Move(name: "In and out knee")
        ]
    }
    
}
