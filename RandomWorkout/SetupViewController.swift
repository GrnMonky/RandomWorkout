//
//  FirstViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import UIKit


var EndTime:NSDate = NSDate()
var Infinite = false

class SetupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Update()
        
        StopTimePicker.date = NSDate(timeIntervalSinceNow: 60 * 16)
        
        EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
        
        UseEndTimeSwitch.on = false
        
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
    
    
    @IBAction func InfiniteSwitched(sender: UISwitch) {
        StopTimePicker.enabled = !sender.on
        if(sender.on)
        {
            EndTimeLbl.text = "Infinite"
        }
        else
        {
            EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
        }
    }
    
    @IBAction func TimeIncremented(sender: UIStepper) {
        
        EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
    }
    
    func Update()
    {
        StopTimePicker.minimumDate = NSDate(timeIntervalSinceNow: 120)
        
        if(!UseEndTimeSwitch.on)
        {
        EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //var WorkoutView = segue.destinationViewController as! WorkoutViewController
        
        EndTime = StopTimePicker.date
        Infinite = UseEndTimeSwitch.on
    }
    
    

}

