//
//  AllTasksVC.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-05.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit
import CoreData

class AllTasksVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    @IBAction func addTaskPressed(_ sender: UIBarButtonItem) {
        let newTaskModal = CreateNewTaskVC()
        newTaskModal.modalPresentationStyle = .overCurrentContext
        present(newTaskModal, animated: true, completion: nil)
    }
    
    
}
