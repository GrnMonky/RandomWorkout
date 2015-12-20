//
//  TableViewCell.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/20/15.
//  Copyright © 2015 Ginkgo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Switch: UISwitch!
    
    var Content: Move? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func SwitchChanged(sender: AnyObject) {
        Content!.Removed = !Switch.on
    }
}
