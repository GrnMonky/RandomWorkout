//
//  Settings.swift
//  RandomWorkout
//
//  Created by Landon Mann on 6/21/16.
//  Copyright © 2016 Ginkgo. All rights reserved.
//

import Foundation

var CurrentSettings = Settings()


func GenerateSettings(){
    
    // Load any saved moves, otherwise load sample data.
    if let savedSettings = loadSettings() {
        CurrentSettings = savedSettings
    } else {
        
    }
}

class Settings: NSObject, NSCoding {
    
    var PrepTime:Int = 5
    
    struct PropertyKey {
        static let prepTimeKey = "prepTime"
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Settings")
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(PrepTime, forKey: PropertyKey.prepTimeKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {

        // Must call designated initializer.
        self.init()
        
        self.PrepTime = aDecoder.decodeIntegerForKey(PropertyKey.prepTimeKey)
    }
}

func saveSettings() {
    
    //How to delete a file
    /*let fileManager : NSFileManager = NSFileManager.defaultManager();
     do {
     try fileManager.removeItemAtPath(Workout.ArchiveURL.path!)
     }catch {
     print(error)
     }*/
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(CurrentSettings, toFile: Settings.ArchiveURL.path!)
    if !isSuccessfulSave {
        print("Failed to save settings...", terminator: "")
    }
}

func loadSettings() -> Settings? {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(Settings.ArchiveURL.path!) as? Settings
}