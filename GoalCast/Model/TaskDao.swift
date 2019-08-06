//
//  Task.swift
//  GoalCast
//
//  Created by Singh Singh on 2019-08-06.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

class TaskDao {
    
    var title : String
    var detail: String
    var dueDate: Date
    var priority: String
    var status: String
    
    init(title: String, detail: String, dueDate: Date, priority: String, status: String) {
        self.title = title
        self.detail = detail
        self.dueDate = dueDate
        self.priority = priority
        self.status = status
    }
    
}
