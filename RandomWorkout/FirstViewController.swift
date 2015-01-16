//
//  FirstViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Update()
        
        StopTimePicker.date = NSDate(timeIntervalSinceNow: 60 * 16)
        
        EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
        
        self.UpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Update"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var UpdateTimer = NSTimer()
    
    @IBOutlet weak var TimeLbl: UILabel!
    
    @IBOutlet weak var UseEndTimeSwitch: UISwitch!
    @IBOutlet weak var StopTimePicker: UIDatePicker!
    @IBOutlet weak var EndTimeLbl: UILabel!
    
    var Time:Int = 5
    
    @IBAction func TimeIncremented(sender: UIStepper) {
        
        Time = Int(sender.value)
        EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
    }
    
    func Update()
    {
        StopTimePicker.minimumDate = NSDate(timeIntervalSinceNow: 120)
        EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var WorkoutView = segue.destinationViewController as WorkoutViewController
        
        WorkoutView.EndTime = StopTimePicker.date
    }
    
    

}

