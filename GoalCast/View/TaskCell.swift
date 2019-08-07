//
//  TaskCell.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-07.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(task: TaskDao){
        self.taskTitle.text = task.title
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let now = df.string(from: task.dueDate)
        self.dueDateLabel.text = now
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
