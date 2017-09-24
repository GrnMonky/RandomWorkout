//
//  Extensions.swift
//  RandomWorkout
//
//  Created by Ginkgo on 8/5/15.
//  Copyright (c) 2015 Ginkgo. All rights reserved.
//

import Foundation

extension Array {
    func sample() -> Element? {
        if count == 0 { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
}

extension Array {
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
