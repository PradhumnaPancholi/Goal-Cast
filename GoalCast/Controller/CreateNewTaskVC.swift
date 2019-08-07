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
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let datePickerView = UIDatePicker()
    
    var tasks : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        preparePickerViews()
        beautifyButton(button: saveButton)
        beautifyButton(button: cancelButton)
    }
    
    func beautifyButton(button: UIButton) {
        button.titleEdgeInsets = UIEdgeInsets(top: 4,left: 4,bottom: 4,right: 4)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    
    func setDateConstraints() {
        datePickerView.minimumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePickerView.maximumDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
    }
    
    @objc func selectedDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: datePickerView.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDateChange() {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TaskDao.priorities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TaskDao.priorities[row].capitalizingFirstLetter()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // use the row to get the selected row from the picker view
        priorityTextField.text = TaskDao.priorities[row].capitalizingFirstLetter()
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addNewTask(task: TaskDao) {
        print("Add task")
    }
    
    func toDate(date:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let date = dateFormatter.date(from:date)!
        return date
    }
    
    @IBAction func createTask(_ sender: Any) {
        let task = TaskDao(title: titleTextField.text!,
                           detail: detailsTextField.text!,
                           dueDate: toDate(date: self.dateTextField.text!),
                           priority: self.priorityTextField.text!,
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
        
        //readData()
        
    }
    
    func readData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        
        do {
            tasks = try managedContext.fetch(fetchRequest)
            print(tasks)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    
    }
    
    func preparePickerViews() {
        let pickerView = UIPickerView()
        priorityTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        
        dateTextField.inputView = datePickerView
        datePickerView.datePickerMode = .date
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.bordered, target: self, action: "selectedDate")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.bordered, target: self, action: "cancelDateChange")
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePickerView
        
        setDateConstraints()
        
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
