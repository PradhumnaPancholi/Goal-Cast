//
//  TasksListVC.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-07.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class TasksListVC: UIViewController {
        
       /* @IBOutlet var tasksTable: UITableView!
        var tasksList : [NSManagedObject] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
            fetchData()
            tasksTable.delegate = self
            tasksTable.dataSource = self
        }
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return tasksList.count
        }
        
        
        func addTaskPressed(_ sender: UIBarButtonItem) {
            let newTaskModal = CreateNewTaskVC()
            newTaskModal.modalPresentationStyle = .overCurrentContext
            present(newTaskModal, animated: true, completion: nil)
        }
        
        func fetchData() {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
            
            do {
                tasksList = try managedContext.fetch(fetchRequest)
                print(tasksList)
                for data in tasksList{
                    print(data.value(forKey: "title"))
                }
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
            
        }*/
        
        
}

