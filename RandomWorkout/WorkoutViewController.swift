
//
//  WorkoutViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class WorkoutViewController: UIViewController {
    
    var beepSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("beep", ofType: "wav")!)
    var buttonSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button", ofType: "wav")!)
    
    var LocalMoves = [Move]()
    var EndTime = NSDate()
    var NextMove:Move? = Move()
    var TotalTimer = NSTimer()
    var SecondsTimer = NSTimer()
    var FiveMinuteTimer = NSTimer()
    var TotalTime:Double = 0.0
    var MoveTime:Double = 0.0
    var State:WorkoutState = WorkoutState.InMove
    var halfway = true;
    private var beep:Int = 5;
    var audioPlayer:AVAudioPlayer;
    var buttonPlayer:AVAudioPlayer;
    var startTime: NSDate = NSDate();
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    var LastMove:Move = Move()
    var previousMoves:[Move] = [Move]()
    
    var start = NSDate();
    
    @IBOutlet weak var CurrentMoveLbl: UILabel!
    @IBOutlet weak var TotalTimeLbl: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NextMoveLbl: UILabel!
    @IBOutlet weak var MoveTimeLbl: UILabel!
    @IBOutlet weak var SetMoveTimeLbl: UILabel!
    @IBOutlet weak var MoveTimeStepper: UIStepper!
    @IBOutlet weak var MoveWeightLbl: UILabel!
    @IBOutlet weak var MoveWeightStepper: UIStepper!
    
    @IBOutlet weak var NeutralBtn: UIButton!

    required init?(coder aDecoder: NSCoder){
        //fatalError("init(coder:) has not been implemented")
        audioPlayer = try! AVAudioPlayer(contentsOfURL: beepSound)
        audioPlayer.prepareToPlay()
        buttonPlayer = try! AVAudioPlayer(contentsOfURL: buttonSound)
        buttonPlayer.prepareToPlay()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.TotalTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(WorkoutViewController.update), userInfo: nil, repeats: true)
        start = NSDate()
        UIApplication.sharedApplication().idleTimerDisabled = true
        beep = 5
        
        //self.SecondsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("beep"), userInfo: nil, repeats: true)
        
        
        //self.FiveMinuteTimer = NSTimer.scheduledTimerWithTimeInterval(60 * 5, target: self, selector: Selector("sayTime"), userInfo: nil, repeats: true)
        
        let dummyMove = Move(name: "Warm Up")
        dummyMove.Time = 0
        dummyMove.Weight = 0
        CurrentMove = dummyMove
        
        NextMove = ChooseNextMove()
        startTime = NSDate()
    }
    
    override func viewDidDisappear(animated : Bool){
        HealthKitHelper.SaveBasicWorkout(startTime, end: NSDate(), interval: TotalTime)
        UIApplication.sharedApplication().idleTimerDisabled = false
    }
    
    
    private var _currentMove:Move!
    var CurrentMove:Move{
        get{
            return _currentMove
        }
        set(newValue) {
            _currentMove = newValue
            
            CurrentMoveLbl.text = _currentMove.Name
            MoveWeightStepper.value = Double(_currentMove.Weight)
            MoveTimeStepper.value = Double(_currentMove.Time)
            SetMoveTimeLbl.text = _currentMove.Time.description
            MoveWeightLbl.text = _currentMove.Weight.description
            ImageView.image = _currentMove.Media
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        let diff = -start.timeIntervalSinceNow
        start = NSDate()
        TotalTimeLbl.text = Helpers.ConvertFloatToTime(TotalTime)
        TotalTime =  TotalTime + diff
        MoveTimeLbl.text = Helpers.ConvertFloatToTimeMilli(MoveTime)
        MoveTime = MoveTime - diff
        
        if(self.State == WorkoutState.Preping){
            if( beep > Int(MoveTime) ){
            audioPlayer.play()
                beep -= 1
            }
        }
        
        if(Float(MoveTime) <= Float(CurrentMove.Time/2) && State == WorkoutState.InMove && halfway == false)
        {
            halfway = true
            buttonPlayer.play()
        }
        if(MoveTime <= 0){
            UpdateState()
        }
    }
    
    func CheckWorkoutComplete() -> Bool{
        if(!CurrentWorkout.Infinite)
        {
            let result = NSDate().compare(EndTime)
            if(result == NSComparisonResult.OrderedDescending || result ==  NSComparisonResult.OrderedSame){
                
                Speak("Workout Completed")
                Done()
                return true
            }
        }
        
        return false
    }
    
    /*func beep(){

        if(self.State == WorkoutState.Preping && MoveTime > 0.5){
            //Helpers.PlaySound(beepSound!)
            audioPlayer.play()
        }
    }*/
    
    var FiveMinutes = 0
    func sayTime(){
        FiveMinutes += 5
        Speak("\(FiveMinutes) minutes")
    }
    
    func UpdateState(){
        switch(State){
        case .InMove:
            //Go to preping
            if CheckWorkoutComplete() {
                return
            }
            audioPlayer.play()
            MoveTime = 5
            beep = 5
            NextMoveLbl.text = "Up next: \(NextMove!.Name)"
            SpeakMove(NextMove!)
            State = WorkoutState.Preping
            break
        case .Preping:
            //Go to move
            halfway = false
            CurrentMove = NextMove!
            MoveTime = Double(NextMove!.Time)
            NextMoveLbl.text = ""
            NextMove = ChooseNextMove()
            if NextMove == nil{
                Done()
            }
            State = WorkoutState.InMove
            //EnableAllBtns()
            break
        }
    }
    
    @IBAction func Skip(sender: AnyObject)
    {
        UpdateState()
    }
    
    @IBAction func DoneAction(sender: AnyObject){
        
        Done()
    }
    
    func Done()
    {
        TotalTimer.invalidate()
        SecondsTimer.invalidate()
        FiveMinuteTimer.invalidate()
        previousMoves = [Move]()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func SpeakMove(MoveToSpeak:Move)
    {
        myUtterance = AVSpeechUtterance(string: MoveToSpeak.Name)
        myUtterance.rate = 0.5
        synth.speakUtterance(myUtterance)
    }
    
    func Speak(string:String)
    {
        myUtterance = AVSpeechUtterance(string: string)
        myUtterance.rate = 0.5
        synth.speakUtterance(myUtterance)
    }
    
    @IBAction func MoveTimeChanged(sender: UIStepper) {
        CurrentMove.Time = Int(MoveTimeStepper.value)
        SetMoveTimeLbl.text = CurrentMove.Time.description
    }

    @IBAction func WeightTimeChanged(sender: AnyObject) {
        CurrentMove.Weight = Int(MoveWeightStepper.value)
        MoveWeightLbl.text = CurrentMove.Weight.description
    }
    
    @IBAction func NeutralClicked(sender: AnyObject) {
        CurrentMove.Removed = true
        //DisableAllBtns()
    }
    
    /*func DisableAllBtns(){
        self.HarderBtn?.enabled = false
        self.NeutralBtn?.enabled = false
        self.EasierBtn?.enabled = false
    }
    
    func EnableAllBtns(){
        self.HarderBtn?.enabled = true
        self.NeutralBtn?.enabled = true
        self.EasierBtn?.enabled = true
    }*/
    
    

    
    private func ChooseNextMove() -> Move? {
        //let timeLeft = EndTime - NSDate(CurrentMove.Time)
        
        var movesDoable = [Move]()
        
        if !(LocalMoves.contains({!$0.Removed})){
                return nil
        } else if LocalMoves.count == 1 {
            
            movesDoable.append(LocalMoves[0])
        }
        else
        {
            for move in LocalMoves
            {
                /*move.Time < timeLeft &&*/
                if (!(previousMoves.filter({$0 === move}).count > 0) && !move.Removed && move != CurrentMove)
                {
                    movesDoable.append(move)
                }
            }
        }
        
        if(movesDoable.count != 0)
        {
            var move : Move?
            //var old : Move?
            
            move = movesDoable.sample()
            
            /*if movesDoable.count > 1 {
            do {
                move = movesDoable.sample()
            } while previousMoves.filter({$0 === move}).count > 0
            }
            else{
                move = movesDoable[0]
            }*/
            
            previousMoves.append(move!)
            
            while Moves.count <= previousMoves.count{
                //previousMoves.removeAtIndex(0)
                previousMoves = [Move]()
            }
            return move!
        }
        else{
            previousMoves = [Move]()
            return ChooseNextMove()
            /*var cooldown = Move(name:"CoolDown")
            cooldown.Time = 45//timeLeft
            return cooldown*/
        }
    }
}

enum WorkoutState{
    case InMove
    case Preping
}
