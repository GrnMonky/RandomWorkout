//
//  Tag.swift
//  RandomWorkout
//
//  Created by Ginkgo on 8/30/15.
//  Copyright (c) 2015 Ginkgo. All rights reserved.
//

import Foundation

var GlobalTags = [String]()

class Tag: NSObject {//, NSCoding{
    
    required init?(coder aDecoder: NSCoder){}
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("tags")

}

func saveTags() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(GlobalTags, toFile: Tag.ArchiveURL.path!)
    if !isSuccessfulSave {
        print("Failed to save tags...", terminator: "")
    }
}

func loadTags() -> [Tag]? {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(Tag.ArchiveURL.path!) as? [Tag]
}
