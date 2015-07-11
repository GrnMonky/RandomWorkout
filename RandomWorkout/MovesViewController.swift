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
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /*for index in 0..<10{
            allRows.append("Cell at index of \(index)")
        }*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setLeftBarButtonItem(editButtonItem(), animated: false)
        
        
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
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return Moves.count
            
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("identifier",
                forIndexPath: indexPath) as! UITableViewCell
            
            cell.textLabel!.text = Moves[indexPath.row].Name
            
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
    
}

