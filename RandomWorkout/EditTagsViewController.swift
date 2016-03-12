//
//  TagsViewController.swift
//  RandomWorkout
//
//  Created by Landon Mann on 1/1/16.
//  Copyright © 2016 Ginkgo. All rights reserved.
//

import UIKit

class EditTagsViewController: UITableViewController {
    
    
    var TagsArray = ArrayWrapper<String>()
    var CurrentTags:[String]
    {
        get{ return TagsArray.array }
        set(val){ TagsArray.array = val }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /*override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView!.setEditing(editing, animated: animated)
    }*/
    
    override func viewWillAppear(animated: Bool) {
        //saveMoves()
        super.viewWillAppear(animated)
        
        for cell in tableView.visibleCells {
            if cell.selected{
                tableView(tableView, didSelectRowAtIndexPath: tableView.indexPathForCell(cell)!)
            }
        }
    }
    
    /*required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /*for index in 0..<10{
        allRows.append("Cell at index of \(index)")
        }*/
        
    }*/
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return GlobalTags.count
            
    }
    
    /*override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }*/
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("TagCell",
                forIndexPath: indexPath)
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell.textLabel!.text = GlobalTags[indexPath.row]
            
            if let text = cell.textLabel!.text {
                if CurrentTags.contains(text){
                    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .None)
                    tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
                }
            }
            
            return cell
    }
    
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath){
        
            if editingStyle == .Delete{
                
                removeTag(){ action -> Void in
                    let tag = GlobalTags[indexPath.row]
                    GlobalTags.removeAtIndex(indexPath.row)
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
                    for move in Moves {
                        move.Tags = move.Tags.filter({$0 != tag})
                    }
                }
            }
    }
    
    func removeTag(actionParam: (UIAlertAction) -> Void){
        //Create the AlertController
        let myAlertController: UIAlertController = UIAlertController(title: "Hey!", message: "Removing this tag will remove it from all moves", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        myAlertController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Continue", style: .Default, handler:  actionParam )
        myAlertController.addAction(nextAction)
        
        //Present the AlertController
        self.presentViewController(myAlertController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }
    
    func IsCellSelected(cell: UITableViewCell) -> Bool{
        return cell.accessoryType != UITableViewCellAccessoryType.None
    }

    @IBAction func Add(sender: UIBarButtonItem) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Tag", message: nil, preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.autocapitalizationType = .Words
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            GlobalTags.append(textField.text!)
            self.CurrentTags.append(textField.text!)
            self.tableView.reloadData()
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: false, completion: nil)
    }
    
    @IBAction func Done(sender: UIBarButtonItem) {
        CurrentTags = [String]()
        for cell in tableView.visibleCells{
            if IsCellSelected(cell) {
                CurrentTags.append(cell.textLabel!.text!)
            }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}