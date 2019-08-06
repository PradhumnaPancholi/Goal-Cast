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

    var tasks : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addNewTask() {
        print("Add task")
    }
    
//    TEMPORARY
    func createData() {
        print("dsad")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let taskEntity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)!
        
        let task = NSManagedObject(entity: taskEntity, insertInto: managedContext)
        task.setValue("Groceries", forKeyPath: "title")
        task.setValue("Go for groceries in no frills", forKeyPath: "detail")
        
        do {
            try managedContext.save()
            print("Saved")
        } catch let error as NSError {
            print("Could not save. \(error)")
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
