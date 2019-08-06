//
//  Task.swift
//  GoalCast
//
//  Created by Singh Singh on 2019-08-06.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

class Tasksdasd {
    
    var title : String
    var description: String
    var dueDate: Date
    var priority: Priority
    var isCompleted: Bool
    
    init(title: String, description: String, dueDate: Date, priority: Priority, isCompleted: Bool) {
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.priority = priority
        self.isCompleted = isCompleted
    }
    
}
