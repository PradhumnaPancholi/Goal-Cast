//
//  TaskViewCell.swift
//  GoalCast
//
//  Created by Amrit on 2019-08-07.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TaskCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var priorityLabel: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
