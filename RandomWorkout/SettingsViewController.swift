//
//  SettingsViewController.swift
//  RandomWorkout
//
//  Created by Landon Mann on 6/21/16.
//  Copyright © 2016 Ginkgo. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var PrepTimeDisplay: UILabel!
    @IBOutlet weak var PrepTimeStepper: UIStepper!
    
    override func viewDidLoad() {
        PrepTimeStepper.value = Double(CurrentSettings.PrepTime)
        PrepTimeDisplay.text = String(CurrentSettings.PrepTime)
    }
    
    @IBAction func PrepTimeStepperChanged(sender: UIStepper) {
        
        CurrentSettings.PrepTime = Int(PrepTimeStepper.value)
        PrepTimeDisplay.text = String(CurrentSettings.PrepTime)
    }
}