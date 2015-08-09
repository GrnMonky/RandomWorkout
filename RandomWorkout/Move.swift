//
//  Move.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation

/*var Moves : [Move] {
    get{
        return MovesHolder().Moves
    }
}

class MovesHolder{
    
    let Moves : [Move]
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(Moves, forKey: "Moves")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        Moves = aDecoder.decodeObjectForKey("Moves") as! [Move]
    }
}*/

var Moves = [Move]()

func GenerateMoves(){
    
// Load any saved meals, otherwise load sample data.
if let savedMoves = loadMoves() {
    Moves = savedMoves
    
} else {
    // Load the sample data.
    Moves = [
        
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
        Move(name: "In and out knee"),
        Move(name: "Shoulder flys"),
        Move(name: "Bent over flys"),
        Move(name: "Ski abs"),
        Move(name: "Hammer curls"),
        Move(name: "Alphabet abs"),
        Move(name: "Side plank dance kick"),
        Move(name: "Scarecrow press"),
        Move(name: "Marching bridge")
    ]
    }
}


/*class Move {

    var Name:String = ""
    var Time:Int = 30
    var Weight:Int = 0
    var Tags:[String] = [String]()
    var Removed = false

    init(name:String){
        Name = name
    }

    init(){
        Name = "New Move";
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
            Move(name: "In and out knee"),
            Move(name: "Shoulder flys"),
            Move(name: "Bent over flys"),
            Move(name: "Ski abs"),
            Move(name: "Hammer curls"),
            Move(name: "Alphabet abs"),
            Move(name: "Side plank dance kick"),
            Move(name: "Scarecrow press"),
            Move(name: "Marching bridge")
        ]
    }
    
}*/

class Move: NSObject, NSCoding {
    // MARK: Properties
    
    //var name: String
    //var photo: UIImage?
    //var rating: Int
    
    var Name:String = ""
    var Time:Int = 30
    var Weight:Int = 0
    //var Tags:[String] = [String]()
    var Removed = false
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("moves")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let timeKey = "time"
        static let weightKey = "weight"
        static let removeKey = "removed"
    }
    
    // MARK: Initialization
    
    init(name: String) {
        // Initialize stored properties.
        self.Name = name
        
        //super.init(;
        
        // Initialization should fail if there is no name or if the rating is negative.
        /*if name.isEmpty || rating < 0 {
            return nil
        }*/
    }
    
    override init(){
        Name = "New Move";
        
        //super.init;
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(Name, forKey: PropertyKey.nameKey)
        aCoder.encodeInteger(Time, forKey: PropertyKey.timeKey)
        aCoder.encodeInteger(Weight, forKey: PropertyKey.weightKey)
        aCoder.encodeBool(Removed, forKey: PropertyKey.removeKey)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        
        // Must call designated initializer.
        self.init()
        
        self.Name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        self.Time = aDecoder.decodeIntegerForKey(PropertyKey.timeKey)
        
        self.Weight = aDecoder.decodeIntegerForKey(PropertyKey.weightKey)
        
        self.Removed = aDecoder.decodeBoolForKey(PropertyKey.removeKey)
        
    }
    
}

func saveMoves() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(Moves, toFile: Move.ArchiveURL.path!)
    if !isSuccessfulSave {
        print("Failed to save moves...")
    }
}

func loadMoves() -> [Move]? {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(Move.ArchiveURL.path!) as? [Move]
}
