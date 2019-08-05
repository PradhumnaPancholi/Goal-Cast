//
//  AllTasksVC.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-05.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class AllTasksVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        newTaskModal.modalPresentationStyle = .custom
        present(newTaskModal, animated: true, completion: nil)
    }
    
}
