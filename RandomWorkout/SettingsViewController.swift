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
    
    @IBOutlet weak var PlaySoundSwitch: UISwitch!
    
    override func viewDidLoad() {
        GenerateSettings()
        PrepTimeStepper.value = Double(CurrentSettings.PrepTime)
        PrepTimeDisplay.text = String(CurrentSettings.PrepTime)
        PlaySoundSwitch.setOn(Settings.playSound, animated: false)
    }
    
    @IBAction func PrepTimeStepperChanged(_ sender: UIStepper) {
        
        CurrentSettings.PrepTime = Int(PrepTimeStepper.value)
        PrepTimeDisplay.text = String(CurrentSettings.PrepTime)
        saveSettings()
    }
    
    @IBAction func PlaySoundChanged(_ sender: UISwitch) {
        Settings.playSound = sender.isOn
    }
}
