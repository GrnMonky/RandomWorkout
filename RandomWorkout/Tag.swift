//
//  Tag.swift
//  RandomWorkout
//
//  Created by Ginkgo on 8/30/15.
//  Copyright (c) 2015 Ginkgo. All rights reserved.
//

import Foundation

var GlobalTags = [String]()

func GenerateTags(){
    
    // Load any saved moves, otherwise load sample data.
    if let savedTags = loadTags() {
        GlobalTags = savedTags
        
    } else {
        GlobalTags = [
            "Cardio",
            "Strength"
        ]
    }
}

class Tags{
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Tags")
}

func saveTags() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(GlobalTags, toFile: Tags.ArchiveURL.path!)
    if !isSuccessfulSave {
        print("Failed to save tags...", terminator: "")
    }
}

func loadTags() -> [String]? {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(Tags.ArchiveURL.path!) as? [String]
}
