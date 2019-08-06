//
//  CreateNewTaskVC.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-04.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit
import CoreData

class CreateNewTaskVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priorityTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    
    var tasks : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //readData()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addNewTask(task: TaskDao) {
        print("")
        print("Add task")
    }
    
    @IBAction func createTask(_ sender: Any) {
        let moderate = Priority.MODERATE
        let task = TaskDao(title: titleTextField.text!,
                           detail: detailsTextField.text!,
                           dueDate: Date(),
                           priority: Priority.LOW.rawValue,
                           status: moderate.rawValue)
        addTaskToCoreData(taskDao: task)
    }
    
    //    TEMPORARY
    func addTaskToCoreData(taskDao: TaskDao) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let taskEntity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)!
        
        let task = NSManagedObject(entity: taskEntity, insertInto: managedContext)
        task.setValue(taskDao.title , forKeyPath: "title")
        task.setValue(taskDao.detail , forKeyPath: "detail")
        task.setValue(taskDao.dueDate , forKeyPath: "dueDate")
        task.setValue(taskDao.priority, forKey: "priority")
        task.setValue(taskDao.status , forKey: "status")
        
        do {
            try managedContext.save()
            print("Saved")
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        readData()
        
    }
    
    func readData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        
        do {
            tasks = try managedContext.fetch(fetchRequest)
//            let task = tasks[0]
//            print(task.(forKey: "title"))
            print(tasks)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
