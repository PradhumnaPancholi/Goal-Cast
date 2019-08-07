//
//  CreateNewTaskVC.swift
//  GoalCast
//
//  Created by Pradhumna Pancholi on 2019-08-04.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit
import CoreData

class CreateNewTaskVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priorityTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var formModal: UIView!
    @IBOutlet weak var priorityPickerView: UIPickerView!
    
    var tasks : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
//        priorityPickerView.isHidden = true
        
        priorityPickerView.delegate = self as? UIPickerViewDelegate
        priorityPickerView.dataSource = self as? UIPickerViewDataSource
        
        something()

    }
    
    func something() {
        priorityTextField.inputView = priorityPickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TaskDao.priorities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TaskDao.priorities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // use the row to get the selected row from the picker view
        print(row, component)
        
        // using the row extract the value from your datasource (array[row])
    }
    
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addNewTask(task: TaskDao) {
        print("")
        print("Add task")
    }
    
    @IBAction func createTask(_ sender: Any) {
        let task = TaskDao(title: titleTextField.text!,
                           detail: detailsTextField.text!,
                           dueDate: Date(),
                           priority: Priority.LOW.rawValue,
                           status: Status.ACTIVE.rawValue)
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
