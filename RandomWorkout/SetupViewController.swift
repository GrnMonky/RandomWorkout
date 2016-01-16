//
//  FirstViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import UIKit





class SetupViewController: UIViewController {
    
    var currentTime: Int {
        get{
            return Int(ceil(StopTimePicker.date.timeIntervalSinceDate(NSDate())/60))
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Update()
        
        GenerateWorkout()
        
        
        StopTimePicker.date = NSDate(timeIntervalSinceNow: Double(CurrentWorkout.TimeDiff))
        
        EndTimeLbl.text = String(currentTime) + " mins"
        
        UseEndTimeSwitch.on = false
        
        self.UpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Update"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        
        AllMovesSwitch.on = CurrentWorkout.MoveTagsOn
        SelectTagsBtn.enabled = CurrentWorkout.MoveTagsOn
        
        GenerateMoves()
        GenerateTags()
        
        HealthKitHelper.Setup()
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
    @IBOutlet weak var SelectTagsBtn: UIButton!
    @IBOutlet weak var AllMovesSwitch: UISwitch!
    
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
    
    @IBAction func AllMovesSwitched(sender: UISwitch){
        SelectTagsBtn.enabled = sender.on
        CurrentWorkout.MoveTagsOn = sender.on
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
    
    var taggedMoves = [Move]()
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if let ident = identifier {
            if ident == "Workout" {
                if !CurrentWorkout.MoveTagsOn {
                    taggedMoves = Moves.filter({!$0.Removed})
                }
                else{
                taggedMoves = [Move]()
                for move in Moves{
                    for tag in CurrentWorkout.WorkoutTags {
                        if !move.Removed && move.Tags.contains(tag){
                            taggedMoves.append(move)
                            break
                        }
                    }
                }
                }
                
                if taggedMoves.count < 1 {
                    return false;
                }
                
                return true
            }
        }
        return true
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //var WorkoutView = segue.destinationViewController as! WorkoutViewController
        
        CurrentWorkout.Infinite = UseEndTimeSwitch.on
        
        if let NavView = segue.destinationViewController as? UINavigationController {
            if let TagView = NavView.childViewControllers.first! as? EditTagsViewController {
                TagView.TagsArray = CurrentWorkout.WorkoutTagsReference
            }
            if let WorkoutView = NavView.childViewControllers.first! as? WorkoutViewController {
                CurrentWorkout.TimeDiff = (Int)(StopTimePicker.date.timeIntervalSinceDate(NSDate()))
                WorkoutView.EndTime = StopTimePicker.date
                WorkoutView.LocalMoves = taggedMoves
            }
        }
    }
}

