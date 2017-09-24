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
    
    override func viewWillAppear(_ animated: Bool) {
        //saveMoves()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return Moves.count
            
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath as IndexPath) as! TableViewCell
            
            
            
            cell.textLabel!.text = Moves[indexPath.row].Name
        cell.Switch.isOn = !Moves[indexPath.row].Removed
            cell.Content = Moves[indexPath.row]
            
            return cell
            
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath)
        -> UITableViewCellEditingStyle{
            return .delete
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView!.setEditing(editing, animated: animated)
    }

    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath){
            
        if editingStyle == .delete{
                /* First remove this object from the source */
            Moves.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .left)
            }
            
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "EditMoveViewController") as! EditMoveViewController
        controller.Index = indexPath.row
        self.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        // Cover Vertical is necessary for CurrentContext
        self.modalPresentationStyle = .currentContext
        
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func showAlertTapped(_ sender: AnyObject) {
        //Create the AlertController
        let myAlertController: UIAlertController = UIAlertController(title: "Hey!", message: "Are You sure you want to delete every move?", preferredStyle: .alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .cancel) { action -> Void in
            //Do some stuff
        }
        myAlertController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Yes", style: .default) { action -> Void in
            
            
            Moves = [Move]()
            self.tableView.reloadData()
        }
        myAlertController.addAction(nextAction)
        
        
        //Present the AlertController
        self.present(myAlertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let EditView = segue.destination as! EditMoveViewController
        
        EditView.Index = -1
        tableView.reloadData()
    }
    
}

