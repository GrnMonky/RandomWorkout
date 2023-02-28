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
        GlobalTags = []
    }
}

class Tags{
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Tags")
}

func saveTags() {
    do {
        GlobalTags = Array(Set(Moves.compactMap{ $0.Tags}.flatMap{$0})).sorted()
        let data = try NSKeyedArchiver.archivedData(withRootObject: GlobalTags, requiringSecureCoding: false)
        try data.write(to: Tags.ArchiveURL)
    } catch {
        print("Failed to save moves...", terminator: "")
    }
}

func loadTags() -> [String]? {
    if let nsData = NSData(contentsOf: Tags.ArchiveURL) {
            do {

                let data = Data(referencing:nsData)

                if let tags = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String] {
                    return tags
                }
            } catch {
                print("Couldn't read file.")
                return nil
            }
        }
    return nil
}
