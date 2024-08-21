//
//  Extensions.swift
//  RandomWorkout
//
//  Created by Ginkgo on 8/5/15.
//  Copyright (c) 2015 Ginkgo. All rights reserved.
//

import Foundation
import UIKit

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

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        // Create a new UIGraphicsImageRenderer context
        let renderer = UIGraphicsImageRenderer(size: size)
        
        // Draw the image in the context
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return resizedImage
    }
}
