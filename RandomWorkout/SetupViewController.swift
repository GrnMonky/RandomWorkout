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
    
    var currentTime: Int {
        get{
            return Int(ceil(StopTimePicker.date.timeIntervalSinceDate(NSDate())/60))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Update()
        
        StopTimePicker.date = NSDate(timeIntervalSinceNow: 60 * 16)
        
        EndTimeLbl.text = String(currentTime) + " mins"
        
        UseEndTimeSwitch.on = false
        
        self.UpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Update"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        
        GenerateMoves()
    }
    
    override func viewWillAppear(animated: Bool) {
        //saveMoves()
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
    
    
    var stepperValue = 0
    @IBAction func TimeStepperChanged(sender: UIStepper) {
        let diff = sender.value - Double(stepperValue)
        if(diff > 0 || currentTime > 2){
        StopTimePicker.date = StopTimePicker.date.dateByAddingTimeInterval(diff * 60)
        let min = NSCalendar.currentCalendar().component(NSCalendarUnit.Minute, fromDate: StopTimePicker.date)
        stepperValue = min
        }
        sender.value = Double(stepperValue)
    }
    
    @IBAction func InfiniteSwitched(sender: UISwitch) {
        StopTimePicker.enabled = !sender.on
        if(sender.on)
        {
            EndTimeLbl.text = "Infinite"
            StopTimePicker.userInteractionEnabled = false
            StopTimePicker.alpha = 0.5
        }
        else
        {
            EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
            StopTimePicker.userInteractionEnabled = true
            StopTimePicker.alpha = 1;
        }
    }
    
    @IBAction func TimeIncremented(sender: UIStepper) {
        
        EndTimeLbl.text = String(currentTime) + " mins"
    }
    
    func Update()
    {
        StopTimePicker.minimumDate = NSDate(timeIntervalSinceNow: 120)
        
        if(!UseEndTimeSwitch.on)
        {
        EndTimeLbl.text = String(currentTime) + " mins"
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //var WorkoutView = segue.destinationViewController as! WorkoutViewController
        
        EndTime = StopTimePicker.date
        Infinite = UseEndTimeSwitch.on
    }
}

