//
//  TagsViewController.swift
//  RandomWorkout
//
//  Created by Landon Mann on 1/1/16.
//  Copyright © 2016 Ginkgo. All rights reserved.
//

import UIKit

class EditTagsViewController: UITableViewController {
    
    
    @IBOutlet weak var AddButton: UIBarButtonItem!
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
    
    override func viewWillAppear(_ animated: Bool) {
        //saveMoves()
        GenerateTags()
        super.viewWillAppear(animated)
    }
    
    /*required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     
     /*for index in 0..<10{
      allRows.append("Cell at index of \(index)")
      }*/
     
     }*/
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return GlobalTags.count
        
    }
    
    /*override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }*/
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagCell",
                                                 for: indexPath as IndexPath)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.textLabel!.text = GlobalTags[indexPath.row]
        
        if let text = cell.textLabel!.text {
            if CurrentTags.contains(text){
                //tableView.selectRow(at: indexPath as IndexPath, animated: true, scrollPosition: .none)
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
            }
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            
            removeTag(){ action -> Void in
                let tag = GlobalTags[indexPath.row]
                GlobalTags.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: .left)
                for move in Moves {
                    move.Tags = move.Tags.filter({$0 != tag})
                }
            }
        }
    }
    
    func removeTag(actionParam: @escaping (UIAlertAction) -> Void){
        //Create the AlertController
        let myAlertController: UIAlertController = UIAlertController(title: "Hey!", message: "Removing this tag will remove it from all moves", preferredStyle: .alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        myAlertController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Continue", style: .default, handler:  actionParam )
        myAlertController.addAction(nextAction)
        
        //Present the AlertController
        self.present(myAlertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCell.AccessoryType.none
    }
    
    func IsCellSelected(cell: UITableViewCell) -> Bool{
        return cell.accessoryType == UITableViewCell.AccessoryType.checkmark
    }
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Tag", message: nil, preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.autocapitalizationType = .words
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            GlobalTags.append(textField.text!)
            self.CurrentTags.append(textField.text!)
            self.tableView.reloadData()
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: false, completion: nil)
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        CurrentTags = [String]()
        for cell in tableView.visibleCells{
            if IsCellSelected(cell: cell) {
                CurrentTags.append(cell.textLabel!.text!)
            }
        }
        self.dismiss(animated: true, completion: {})
    }
}
