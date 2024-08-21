//
//  Move.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation
import UIKit

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

private var defaultMoves = [
    
    //            Move(name: "Burpees", tags: ["Body Weight"]),
    //            Move(name: "Squats"),
    //            Move(name: "Bicep Curls"),
    //            Move(name: "Walking Push-Ups"),
    //            Move(name: "Lunge kick"),
    //            Move(name: "Side Planks with Leg Raises"),
    //            Move(name: "Mountain Climbers"),
    //            Move(name: "Jabs"),
    //            Move(name: "Lunges"),
    //            Move(name: "Push-Up"),
    //            Move(name: "Plank Knee Tuck"),
    //            Move(name: "Shuffle"),
    //            Move(name: "Kicks"),
    //            Move(name: "In and Out abs plank"),
    //            Move(name: "Twist Knee Up"),
    //            Move(name: "Tricep dips"),
    //            Move(name: "Monkey Press"),
    //            Move(name: "Uppercuts"),
    //            Move(name: "Mason Twists"),
    //            Move(name: "C sit abs"),
    //            Move(name: "Dumbbell swings"),
    //            Move(name: "Tricep Kickback"),
    //            Move(name: "Bent over rows"),
    //            Move(name: "Sun Salutation"),
    //            Move(name: "Bicycle kicks"),
    //            Move(name: "Superman"),
    //            Move(name: "Scissor kicks"),
    //            Move(name: "Shoulder push-ups"),
    //            Move(name: "Dive bomber push-ups"),
    //            Move(name: "Warrior"),
    //            Move(name: "Half moon"),
    //            Move(name: "Ab Tucks"),
    //            Move(name: "Jack push-up"),
    //            Move(name: "Spider-Man pushup"),
    //            Move(name: "Side plank hip dips"),
    //            Move(name: "Hip-hop Kicks"),
    //            Move(name: "Squatting shuffle"),
    //            Move(name: "Staggered pushup"),
    //            Move(name: "Calf raises"),
    //            Move(name: "Side kicks"),
    //            Move(name: "Tricep ball push-ups"),
    //            Move(name: "Twisting half moon"),
    //            Move(name: "Power knee"),
    //            Move(name: "Swimmer"),
    //            Move(name: "Skaters"),
    //            Move(name: "Tricep curls"),
    //            Move(name: "Military march"),
    //            Move(name: "Up and over knee"),
    //            Move(name: "Twisting Warrior"),
    //            Move(name: "Chair"),
    //            Move(name: "In and out knee"),
    //            Move(name: "Shoulder flys"),
    //            Move(name: "Bent over flys"),
    //            Move(name: "Ski abs"),
    //            Move(name: "Hammer curls"),
    //            Move(name: "Alphabet abs"),
    //            Move(name: "Side plank dance kick"),
    //            Move(name: "Scarecrow press"),
    //            Move(name: "Marching bridge")
                
                //Body Weight
                Move(name: "Army crawl", tags: ["Body Weight"]),
                Move(name: "Back extensions", tags: ["Body Weight"]),
                Move(name: "Bear crawl", tags: ["Body Weight"]),
                Move(name: "Bicycle crunch", tags: ["Body Weight"]),
                Move(name: "Bicycle kicks", tags: ["Body Weight"]),
                Move(name: "Bird dogs", tags: ["Body Weight"]),
                Move(name: "Bounding", tags: ["Body Weight"]),
                Move(name: "Box jump", tags: ["Body Weight"]),
                Move(name: "Burpees", tags: ["Body Weight"]),
                Move(name: "Bridge", tags: ["Body Weight"]),
                Move(name: "Bridge and reach", tags: ["Body Weight"]),
                Move(name: "Calf raises", tags: ["Body Weight"]),
                Move(name: "Crab walk", tags: ["Body Weight"]),
                Move(name: "Crocodile crawl", tags: ["Body Weight"]),
                Move(name: "Crunches", tags: ["Body Weight"]),
                Move(name: "Dead bug", tags: ["Body Weight"]),
                Move(name: "Donkey kicks", tags: ["Body Weight"]),
                Move(name: "Fire hydrants", tags: ["Body Weight"]),
                Move(name: "Flutter kicks", tags: ["Body Weight"]),
                Move(name: "Glute bridge", tags: ["Body Weight"]),
                Move(name: "Handstand", tags: ["Body Weight"]),
                Move(name: "Hand walk", tags: ["Body Weight"]),
                Move(name: "Hanging knee raise", tags: ["Body Weight"]),
                Move(name: "Hanging leg raise", tags: ["Body Weight"]),
                Move(name: "Hanging leg raise with split", tags: ["Body Weight"]),
                Move(name: "Heel touches", tags: ["Body Weight"]),
                Move(name: "High knees run", tags: ["Body Weight"]),
                Move(name: "Hip lift crunch", tags: ["Body Weight"]),
                Move(name: "Hollow body rock", tags: ["Body Weight"]),
                Move(name: "Jump squats", tags: ["Body Weight"]),
                Move(name: "Jumping jacks", tags: ["Body Weight"]),
                Move(name: "L-sit", tags: ["Body Weight"]),
                Move(name: "Lateral side jumps", tags: ["Body Weight"]),
                Move(name: "Leaping", tags: ["Body Weight"]),
                Move(name: "Lunges", tags: ["Body Weight"]),
                Move(name: "Lunge jumps", tags: ["Body Weight"]),
                Move(name: "Lying leg lift", tags: ["Body Weight"]),
                Move(name: "Mountain climbers", tags: ["Body Weight"]),
                Move(name: "Oblique crunch", tags: ["Body Weight"]),
                Move(name: "Pistol squats", tags: ["Body Weight"]),
                Move(name: "Planks", tags: ["Body Weight"]),
                Move(name: "Pull-ups", tags: ["Body Weight"]),
                Move(name: "Push-ups", tags: ["Body Weight"]),
                Move(name: "Raised leg crunch", tags: ["Body Weight"]),
                Move(name: "Reverse crunch", tags: ["Body Weight"]),
                Move(name: "Russian twists", tags: ["Body Weight"]),
                Move(name: "Side-to-side push-ups", tags: ["Body Weight"]),
                Move(name: "Side planks", tags: ["Body Weight"]),
                Move(name: "Single-leg squat", tags: ["Body Weight"]),
                Move(name: "Skater squats", tags: ["Body Weight"]),
                Move(name: "Sprints", tags: ["Body Weight"]),
                Move(name: "Sumo squat", tags: ["Body Weight"]),
                Move(name: "Superman", tags: ["Body Weight"]),
                Move(name: "Squats", tags: ["Body Weight"]),
                Move(name: "Squat holds", tags: ["Body Weight"]),
                Move(name: "Swimmer", tags: ["Body Weight"]),
                Move(name: "Toe touch", tags: ["Body Weight"]),
                Move(name: "Tricep dips", tags: ["Body Weight"]),
                Move(name: "Tuck jumps", tags: ["Body Weight"]),
                Move(name: "V-ups", tags: ["Body Weight"]),
                Move(name: "Walking planks", tags: ["Body Weight"]),
                Move(name: "Wall squat", tags: ["Body Weight"]),
                Move(name: "Windshield wiper", tags: ["Body Weight"]),
                
                //Jump Rope
                Move(name: "Alternate foot jumps", tags: ["Jump Rope"]),
                Move(name: "Backwards jumping", tags: ["Jump Rope"]),
                Move(name: "Basic jump", tags: ["Jump Rope"]),
                Move(name: "Bell jump", tags: ["Jump Rope"]),
                Move(name: "Boxer step", tags: ["Jump Rope"]),
                Move(name: "Can Can", tags: ["Jump Rope"]),
                Move(name: "Criss-cross", tags: ["Jump Rope"]),
                Move(name: "Criss-cross double unders", tags: ["Jump Rope"]),
                Move(name: "Double unders", tags: ["Jump Rope"]),
                Move(name: "Foot cross jump", tags: ["Jump Rope"]),
                Move(name: "Full twist", tags: ["Jump Rope"]),
                Move(name: "Half twist", tags: ["Jump Rope"]),
                Move(name: "Heel-to-heel", tags: ["Jump Rope"]),
                Move(name: "Heel-toe step", tags: ["Jump Rope"]),
                Move(name: "Hopscotch", tags: ["Jump Rope"]),
                Move(name: "High jumps", tags: ["Jump Rope"]),
                Move(name: "High knees", tags: ["Jump Rope"]),
                Move(name: "Jogging step", tags: ["Jump Rope"]),
                Move(name: "Jump rope jacks", tags: ["Jump Rope"]),
                Move(name: "Mummy kicks", tags: ["Jump Rope"]),
                Move(name: "Scissors", tags: ["Jump Rope"]),
                Move(name: "Side under jump", tags: ["Jump Rope"]),
                Move(name: "Side straddle", tags: ["Jump Rope"]),
                Move(name: "Side swing", tags: ["Jump Rope"]),
                Move(name: "Side-to-side jumps", tags: ["Jump Rope"]),
                Move(name: "Single leg jump", tags: ["Jump Rope"]),
                Move(name: "Skier", tags: ["Jump Rope"]),
                Move(name: "Swing jumps", tags: ["Jump Rope"]),
                Move(name: "Toe-to-toe jump", tags: ["Jump Rope"]),
                Move(name: "Wounded duck", tags: ["Jump Rope"]),
                
                //Resistance Band
                Move(name: "Ankle flexion", tags: ["Resistance Band"]),
                Move(name: "Archer pull", tags: ["Resistance Band"]),
                Move(name: "Bird dog", tags: ["Resistance Band"]),
                Move(name: "Bent-over row", tags: ["Resistance Band"]),
                Move(name: "Bicep curl", tags: ["Resistance Band"]),
                Move(name: "Bicycle", tags: ["Resistance Band"]),
                Move(name: "Chest press", tags: ["Resistance Band"]),
                Move(name: "Dead bug", tags: ["Resistance Band"]),
                Move(name: "Donkey kick", tags: ["Resistance Band"]),
                Move(name: "External rotation", tags: ["Resistance Band"]),
                Move(name: "Flye", tags: ["Resistance Band"]),
                Move(name: "Fire Hydrant", tags: ["Resistance Band"]),
                Move(name: "Forward raise", tags: ["Resistance Band"]),
                Move(name: "Front squat", tags: ["Resistance Band"]),
                Move(name: "Glute and lateral raise", tags: ["Resistance Band"]),
                Move(name: "Glute bridge", tags: ["Resistance Band"]),
                Move(name: "Hammer curl", tags: ["Resistance Band"]),
                Move(name: "High plank jack", tags: ["Resistance Band"]),
                Move(name: "Hip hinge", tags: ["Resistance Band"]),
                Move(name: "Jumping jack", tags: ["Resistance Band"]),
                Move(name: "Kneeling crunch", tags: ["Resistance Band"]),
                Move(name: "Lateral hockey jump", tags: ["Resistance Band"]),
                Move(name: "Lateral lunge", tags: ["Resistance Band"]),
                Move(name: "Lateral walk", tags: ["Resistance Band"]),
                Move(name: "Lateral plank walk", tags: ["Resistance Band"]),
                Move(name: "Lateral raise", tags: ["Resistance Band"]),
                Move(name: "Lat pulldown", tags: ["Resistance Band"]),
                Move(name: "Leg extension", tags: ["Resistance Band"]),
                Move(name: "Leg raise with split", tags: ["Resistance Band"]),
                Move(name: "Low plank jack", tags: ["Resistance Band"]),
                Move(name: "Lunge", tags: ["Resistance Band"]),
                Move(name: "Lying hip abduction", tags: ["Resistance Band"]),
                Move(name: "Lying hip adduction", tags: ["Resistance Band"]),
                Move(name: "Lying leg curl", tags: ["Resistance Band"]),
                Move(name: "Lying pullover", tags: ["Resistance Band"]),
                Move(name: "Overhead press", tags: ["Resistance Band"]),
                Move(name: "Plank tap", tags: ["Resistance Band"]),
                Move(name: "Press-up", tags: ["Resistance Band"]),
                Move(name: "Pull apart", tags: ["Resistance Band"]),
                Move(name: "Pulldown", tags: ["Resistance Band"]),
                Move(name: "Pull-up", tags: ["Resistance Band"]),
                Move(name: "Push-up", tags: ["Resistance Band"]),
                Move(name: "Rear delt fly", tags: ["Resistance Band"]),
                Move(name: "Reverse crunch", tags: ["Resistance Band"]),
                Move(name: "Russian twist", tags: ["Resistance Band"]),
                Move(name: "Seated abduction", tags: ["Resistance Band"]),
                Move(name: "Seated adduction", tags: ["Resistance Band"]),
                Move(name: "Seated row", tags: ["Resistance Band"]),
                Move(name: "Squat", tags: ["Resistance Band"]),
                Move(name: "Squat to overhead press", tags: ["Resistance Band"]),
                Move(name: "Single-arm row", tags: ["Resistance Band"]),
                Move(name: "Single leg raise", tags: ["Resistance Band"]),
                Move(name: "Splitter", tags: ["Resistance Band"]),
                Move(name: "Standing abductor", tags: ["Resistance Band"]),
                Move(name: "Standing adductor", tags: ["Resistance Band"]),
                Move(name: "Tricep overhead extension", tags: ["Resistance Band"]),
                Move(name: "Tricep extension", tags: ["Resistance Band"]),
                Move(name: "Triceps kickback", tags: ["Resistance Band"]),
                Move(name: "Upright row", tags: ["Resistance Band"]),
                Move(name: "Woodchopper", tags: ["Resistance Band"]),
            ]


func GenerateMoves(){
    
    // Load any saved moves, otherwise load sample data.
    if let savedMoves = loadMoves(), !savedMoves.isEmpty {
        Moves = savedMoves
    } else {
        // Load the sample data.
        Moves = defaultMoves
    }
}

func ResetMoves() {
    Moves = defaultMoves
    saveMoves()
}

class Move: NSObject, NSCoding {
    
    // MARK: Properties
    
    //var name: String
    //var photo: UIImage?
    //var rating: Int
    
    var Name:String = ""
    var Time:Int = 30
    var Weight:Int = 0
    var Tags:[String] = [String]()
    var Removed = false
    var Media:UIImage?
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //Todo: Standerdize Path names with release
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("moves")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let timeKey = "time"
        static let weightKey = "weight"
        static let removeKey = "removed"
        static let tagsKey = "tags"
        static let mediaKey = "media"
    }
    
    // MARK: Initialization
    
    init(name: String, tags: [String] = []) {
        // Initialize stored properties.
        self.Name = name
        self.Tags = tags;
        
        //super.init();
        
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(Name, forKey: PropertyKey.nameKey)
        aCoder.encode(Time, forKey: PropertyKey.timeKey)
        aCoder.encode(Weight, forKey: PropertyKey.weightKey)
        aCoder.encode(Removed, forKey: PropertyKey.removeKey)
        aCoder.encode(Tags, forKey: PropertyKey.tagsKey)
        aCoder.encode(Media, forKey: PropertyKey.mediaKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        // Must call designated initializer.
        self.init()
        
        self.Name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        self.Time = aDecoder.decodeInteger(forKey: PropertyKey.timeKey)
        
        self.Weight = aDecoder.decodeInteger(forKey: PropertyKey.weightKey)
        
        self.Removed = aDecoder.decodeBool(forKey: PropertyKey.removeKey)
        
        self.Tags = aDecoder.decodeObject(forKey: PropertyKey.tagsKey) as! [String]
        
        self.Media = aDecoder.decodeObject(forKey: PropertyKey.mediaKey) as? UIImage
    }
    
    func getMedia(completion: @escaping (UIImage?) -> Void) {
        if self.Media == nil {
            self.setMedia(completion: completion)
        }
        
        completion(self.Media)
    }
    
    func setMedia(completion: @escaping (UIImage?) -> Void) {
        Helpers.fetchFirstImage(query: "\(self.Name) \(self.Tags.joined(separator: " ")) exercise") { image in
//            let newSize = CGSize(width: 200, height: 200)
            self.Media = image//?.resized(to: newSize)
            completion(image)
        }
    }
    
}

func saveMoves() {
    do {
        saveTags()
        let data = try NSKeyedArchiver.archivedData(withRootObject: Moves, requiringSecureCoding: false)
        try data.write(to: Move.ArchiveURL)
        NotificationCenter.default.post(name: Notification.Name("MoveChanged"), object: nil)
    } catch {
        print("Failed to save moves...", terminator: "")
    }
}

func loadMoves() -> [Move]? {
    if let nsData = NSData(contentsOf: Move.ArchiveURL) {
        do {
            
            let data = Data(referencing:nsData)
            
            if let workout = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Move]? {
                return workout?.sorted(by: {$0.Name < $1.Name})
            }
        } catch {
            print("Couldn't read file.")
            return nil
        }
    }
    return nil
}
