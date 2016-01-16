//
//  EditMoveViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 7/12/15.
//  Copyright (c) 2015 Ginkgo. All rights reserved.
//

import Foundation
import UIKit

class EditMoveViewController: UIViewController {
    
    
    
    var Index : Int!
    private var _move = Move()
    private let arrayReference = ArrayWrapper<String>()
    private var Tags: [String] {
        get{ return arrayReference.array }
        set(val){ arrayReference.array = val }
    }
    
    
    @IBOutlet weak var NameTxtFld: UITextField!
    @IBOutlet weak var TimeDisplay: UILabel!
    @IBOutlet weak var TimeStepper: UIStepper!
    @IBOutlet weak var NavigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Index == -1)
        {
            _move = Move(name: "")
            NameTxtFld.becomeFirstResponder()
        }
        else
        {
            _move = Moves[Index]
        }
        NameTxtFld.text = _move.Name
        NavigationBar.title = _move.Name
        TimeDisplay.text = String(_move.Time)
        TimeStepper.value = Double(_move.Time)
        Tags = _move.Tags
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let NavView = segue.destinationViewController as! UINavigationController
        let TagView = NavView.childViewControllers.first! as! EditTagsViewController
        
        TagView.TagsArray = arrayReference
    }
    
    @IBAction func CancelAction(sender: AnyObject){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func TimeChanged(sender: UIStepper) {
        TimeDisplay.text = String(Int(TimeStepper.value))
    }
    
    @IBAction func DoneAction(sender: AnyObject){
        
        Done()
    }
    
    func Done()
    {
        _move.Time = Int(TimeStepper.value)
        _move.Name = NameTxtFld.text!
        _move.Tags = Tags
        
        if(Index == -1)
        {
            Moves.insert(_move, atIndex: 0)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
