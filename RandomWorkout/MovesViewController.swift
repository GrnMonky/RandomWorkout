//
//  SecondViewController.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/29/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import UIKit

class MovesViewController: UIViewController,
UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    //var tableView: UITableView?
    //var allRows = Moves //[String]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /*for index in 0..<10{
            allRows.append("Cell at index of \(index)")
        }*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.setLeftBarButtonItem(editButtonItem(), animated: false)
        
        //navigationItem.setRightBarButtonItem(, animated: true)
        
        
        //tableView = UITableView(frame: view., style: .Plain)
        
        //tableView.dataSource = self
        //tableView.delegate = self
        
        /*tableView.registerClass(UITableViewCell.classForCoder(),
            forCellReuseIdentifier: "identifier")*/
        
        /*if let theTableView = tableView{
            
        
            
            theTableView.dataSource = self
            theTableView.delegate = self
            theTableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            
            view.addSubview(theTableView)
        }*/
        
        tableView.reloadData()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //saveMoves()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return Moves.count
            
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
                forIndexPath: indexPath) as! TableViewCell
            
            
            
            cell.textLabel!.text = Moves[indexPath.row].Name
            cell.Switch.on = !Moves[indexPath.row].Removed
            cell.Content = Moves[indexPath.row]
            
            return cell
            
    }
    
    func tableView(tableView: UITableView,
        editingStyleForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCellEditingStyle{
            return .Delete
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView!.setEditing(editing, animated: animated)
    }

    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath){
            
            if editingStyle == .Delete{
                /* First remove this object from the source */
                Moves.removeAtIndex(indexPath.row)
               tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            }
            
    }
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("EditMoveViewController") as! EditMoveViewController
        controller.Index = indexPath.row
        self.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        // Cover Vertical is necessary for CurrentContext
        self.modalPresentationStyle = .CurrentContext
        
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func showAlertTapped(sender: AnyObject) {
        //Create the AlertController
        let myAlertController: UIAlertController = UIAlertController(title: "Hey!", message: "Are You sure you want to delete every move?", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        myAlertController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Default) { action -> Void in
            
            
            Moves = [Move]()
            self.tableView.reloadData()
        }
        myAlertController.addAction(nextAction)
        
        
        //Present the AlertController
        self.presentViewController(myAlertController, animated: true, completion: nil)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        let EditView = segue.destinationViewController as! EditMoveViewController
        
        EditView.Index = -1
        tableView.reloadData()
    }
    
}

