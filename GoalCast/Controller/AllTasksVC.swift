//
//  AllTasksVC.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-07.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit
import CoreData

class AllTasksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasksList : [NSObject] = []

    @IBOutlet var tasksTable: UITableView!
    @IBOutlet weak var createButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchData()
        tasksTable.dataSource = self
        tasksTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasksTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskCell {
            let task = tasksList[indexPath.row]
            let title = task.value(forKey: "title")
            let dueDate = task.value(forKey: "dueDate")
            let taskDao = TaskDao(title: title as! String, detail: "",dueDate: dueDate as! Date,priority: Priority.LOW.rawValue, status: Status.ACTIVE.rawValue)
            
            cell.configureCell(task: taskDao)

            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
    @IBAction func createTask(_ sender: Any) {
        let newTaskModal = CreateNewTaskVC()
        newTaskModal.modalPresentationStyle = .overCurrentContext
        present(newTaskModal, animated: true, completion: nil)
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
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
}
