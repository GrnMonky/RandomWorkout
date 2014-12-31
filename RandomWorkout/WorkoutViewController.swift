
//
//  WorkoutViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation
import UIKit

class WorkoutViewController: UIViewController {

    required init(coder aDecoder: NSCoder){
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        initialize()
    }
    
    //Code to be removed from your destinationViewController
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
        // Here you can init your properties
        
    }
    
    private func initialize(){
        CurrentMove = Move()
        NextMove = Move()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.TotalTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        //self.TotalTimer.invalidate()
    }
    
    @IBOutlet weak var CurrentMoveLbl: UILabel!
    @IBOutlet weak var TotalTimeLbl: UILabel!
    @IBOutlet weak var MoveTimeLbl: UILabel!
    
    @IBOutlet weak var HarderBtn: UIButton!
    @IBOutlet weak var NeutralBtn: UIButton!
    @IBOutlet weak var EasierBtn: UIButton!
    
    var CurrentMove:Move = Move()
    var NextMove:Move = Move()
    var TotalTimer = NSTimer()
    var TotalTime:Int = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        TotalTimeLbl.text = String(TotalTime++)
    }
    
    @IBAction func DoneAction(sender: AnyObject){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //To make the move harder add 15 Seconds
    @IBAction func HarderClicked(sender: AnyObject) {
        if( CurrentMove.Time < 120){
            CurrentMove.Time += 15;
        }
        DisableAllBtns()
    }
    
    //To make the move easier subtract 15 Seconds
    @IBAction func EasierClicked(sender: AnyObject) {
        if( CurrentMove.Time > 15){
            CurrentMove.Time -= 15
        }
        DisableAllBtns()
    }
    
    @IBAction func NeutralClicked(sender: AnyObject) {
        DisableAllBtns()
    }
    
    func DisableAllBtns(){
        self.HarderBtn?.enabled = false
        self.NeutralBtn?.enabled = false
        self.EasierBtn?.enabled = false
    }
}

enum WorkoutStates{
    case InMove
    case Preping
}
