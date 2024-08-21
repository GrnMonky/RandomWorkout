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
            return Int(ceil(StopTimePicker.date.timeIntervalSince(Date())/60))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Update()
        
        GenerateWorkout()
        
        
        StopTimePicker.date = Date(timeIntervalSinceNow: Double(CurrentWorkout.TimeDiff))
        
        EndTimeLbl.text = String(currentTime) + " mins"
        
        UseEndTimeSwitch.isOn = CurrentWorkout.Infinite
        
        InfiniteSwitched(UseEndTimeSwitch)
        
        self.UpdateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SetupViewController.Update), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        
        AllMovesSwitch.isOn = CurrentWorkout.MoveTagsOn
        SelectTagsBtn.isEnabled = CurrentWorkout.MoveTagsOn
        
        //Uncomment To reset moves
//        ResetMoves()
        
        GenerateMoves()
        GenerateTags()
        GenerateSettings()
        
        HealthKitHelper.Setup()
        
        setRandomMove()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //saveMoves()
        //setRandomMove()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setRandomMove() {
        getTaggedMoves()
        if taggedMoves.count > 1 {
            RandomMove = taggedMoves.filter{ $0 != RandomMove  }.randomElement() ?? Move()
        } else {
            RandomMove = taggedMoves.randomElement() ?? Move()
        }
        RandomMove.getMedia() { [weak self] image in
            DispatchQueue.main.async {
                self?.RandomMoveImage.image = image
            }
        }
        RandomMoveButton.setTitle(RandomMove.Name, for: .normal)
        
    }
    
    var UpdateTimer = Timer()
    var RandomMove = Move()
    
    //@IBOutlet weak var TimeLbl: UILabel!
    
    @IBOutlet weak var UseEndTimeSwitch: UISwitch!
    @IBOutlet weak var StopTimePicker: UIDatePicker!
    @IBOutlet weak var EndTimeLbl: UILabel!
    @IBOutlet weak var SelectTagsBtn: UIButton!
    @IBOutlet weak var AllMovesSwitch: UISwitch!
    @IBOutlet weak var RandomMoveImage: UIImageView!
    @IBOutlet weak var RandomMoveButton: UIButton!
    
    
    var stepperValue = 0
    @IBAction func TimeStepperChanged(_ sender: UIStepper) {
        let diff = sender.value - Double(stepperValue)
        if(diff > 0 || currentTime > 1){
            StopTimePicker.date = StopTimePicker.date.addingTimeInterval(diff * 60)
            let min = NSCalendar.current.component(.minute, from: StopTimePicker.date)
            stepperValue = min
        }
        sender.value = Double(stepperValue)
    }
    
    @IBAction func InfiniteSwitched(_ sender: UISwitch) {
        StopTimePicker.isEnabled = !sender.isOn
        if(sender.isOn)
        {
            EndTimeLbl.text = "Infinite"
            StopTimePicker.isUserInteractionEnabled = false
            StopTimePicker.alpha = 0.5
        }
        else
        {
            //EndTimeLbl.text = (Int)((StopTimePicker.date.timeIntervalSinceDate(NSDate())/60)).description + " mins"
            Update()
            StopTimePicker.isUserInteractionEnabled = true
            StopTimePicker.alpha = 1;
        }
    }
    
    @IBAction func AllMovesSwitched(_ sender: UISwitch){
        SelectTagsBtn.isEnabled = sender.isOn
        CurrentWorkout.MoveTagsOn = sender.isOn
        setRandomMove()
    }
    
    @IBAction func TimeIncremented(_ sender: UIStepper) {
        
        if currentTime > 1 {
            EndTimeLbl.text = String(currentTime) + " mins"
        } else {
            EndTimeLbl.text = String(currentTime) + " min"
        }
    }
    
    @objc func Update()
    {
        StopTimePicker.minimumDate = NSDate(timeIntervalSinceNow: 60) as Date
        
        if(!UseEndTimeSwitch.isOn)
        {
            if currentTime > 1 {
                EndTimeLbl.text = String(currentTime) + " mins"
            } else {
                EndTimeLbl.text = String(currentTime) + " min"
            }
        }
    }
    var taggedMoves = [Move]()
    
    @discardableResult
    fileprivate func getTaggedMoves() -> [Move] {
        taggedMoves = [Move]()
        if !CurrentWorkout.MoveTagsOn {
            taggedMoves = Moves.filter({!$0.Removed})
        }
        else{
            for move in Moves{
                for tag in CurrentWorkout.WorkoutTags {
                    if !move.Removed && move.Tags.contains(tag){
                        taggedMoves.append(move)
                        break
                    }
                }
            }
        }
        if taggedMoves.isEmpty {
            taggedMoves = Moves
        }
        return taggedMoves
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Workout" {
            getTaggedMoves()
            
            if taggedMoves.count < 1 {
                return false;
            }
            
            return true
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //var WorkoutView = segue.destinationViewController as! WorkoutViewController
        
        CurrentWorkout.Infinite = UseEndTimeSwitch.isOn
        
        if let NavView = segue.destination as? UINavigationController {
            if let TagView = NavView.children.first! as? EditTagsViewController {
                TagView.TagsArray = CurrentWorkout.WorkoutTagsReference
                TagView.AddButton.isHidden = true
                TagView.setupParent = self
            }
            if let WorkoutView = NavView.children.first! as? WorkoutViewController {
                CurrentWorkout.TimeDiff = (Int)(StopTimePicker.date.timeIntervalSince(Date()))
                WorkoutView.EndTime = StopTimePicker.date as NSDate
                WorkoutView.LocalMoves = taggedMoves
            }
        }
    }
}

