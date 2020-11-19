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
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Settings")
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(PrepTime, forKey: PropertyKey.prepTimeKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {

        // Must call designated initializer.
        self.init()
        
        self.PrepTime = aDecoder.decodeInteger(forKey: PropertyKey.prepTimeKey)
    }
}

func saveSettings() {
    do {
        if let nsData = NSData(contentsOf: Settings.ArchiveURL) {
    let data = try? NSKeyedArchiver.archivedData(withRootObject: nsData, requiringSecureCoding: true)
            try data?.write(to: Settings.ArchiveURL)
        }
    }
    catch {
        print("Failed to save settings...", terminator: "")
    }
}

func loadSettings() -> Settings? {
    if let nsData = NSData(contentsOf: Settings.ArchiveURL) {
            do {

                let data = Data(referencing:nsData)

                if let settings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Settings {
                    return settings
                }
            } catch {
                print("Couldn't read file.")
                return nil
            }
        }
        return nil
}


