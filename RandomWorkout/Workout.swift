//
//  Workout.swift
//  RandomWorkout
//
//  Created by Landon Mann on 1/16/16.
//  Copyright © 2016 Ginkgo. All rights reserved.
//

import Foundation

var CurrentWorkout = Workout()


func GenerateWorkout(){
    
    // Load any saved moves, otherwise load sample data.
    if let savedWorkout = loadWorkout() {
        CurrentWorkout = savedWorkout    
    } else {

    }
}

class Workout: NSObject, NSCoding {
    
    // MARK: Properties
    
    var MoveTagsOn = false
    var TimeDiff:Int = 60 * 15
    var Infinite = false
    var WorkoutTagsReference = ArrayWrapper<String>()
    var WorkoutTags: [String] { get{ return WorkoutTagsReference.array }
        set(val){ WorkoutTagsReference.array = val }
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Workout")
    
    // MARK: Types
    
    struct PropertyKey {
        static let moveTagsOnKey = "moveTagsOn"
        static let timeDiffKey = "timeDiff"
        static let infiniteKey = "infinite"
        static let workoutTagsKey = "workoutTags"
    }
    
    // MARK: Initialization
    
    override init(){
        ///Name = "New Move";
        
        //super.init;
    }
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(MoveTagsOn, forKey: PropertyKey.moveTagsOnKey)
        aCoder.encode(TimeDiff, forKey: PropertyKey.timeDiffKey)
        aCoder.encode(Infinite, forKey: PropertyKey.infiniteKey)
        aCoder.encode(WorkoutTags, forKey: PropertyKey.workoutTagsKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        // Must call designated initializer.
        self.init()
        
        WorkoutTagsReference = ArrayWrapper<String>()
        
        self.MoveTagsOn = aDecoder.decodeBool(forKey: PropertyKey.moveTagsOnKey)
        
        self.TimeDiff = aDecoder.decodeInteger(forKey: PropertyKey.timeDiffKey)
        
        self.Infinite = aDecoder.decodeBool(forKey: PropertyKey.infiniteKey)
        
        self.WorkoutTags = aDecoder.decodeObject(forKey: PropertyKey.workoutTagsKey) as! [String]
    }
    
}

func saveWorkout() {
    do {
        let data = try NSKeyedArchiver.archivedData(withRootObject: CurrentWorkout, requiringSecureCoding: false)
        try data.write(to: Workout.ArchiveURL)
    } catch {
        print("Failed to save workout...", terminator: "")
    }
}

func loadWorkout() -> Workout? {
    if let nsData = NSData(contentsOf: Workout.ArchiveURL) {
            do {

                let data = Data(referencing:nsData)

                if let workout = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Workout {
                    return workout
                }
            } catch {
                print("Couldn't read file.")
                return nil
            }
        }
    return nil
}
