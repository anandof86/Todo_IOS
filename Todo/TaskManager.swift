//
//  TaskManager.swift
//  Todolist
//
//  Created by Anand on 9/21/14.
//  Copyright (c) 2014 qruize. All rights reserved.
//

import UIKit
import CoreData

var taskMgr:  TaskManager = TaskManager();

struct task {
    var name = "un-named"
    var descr = "un-named"
}

class TaskManager: NSObject {
    var tasks = [task]()

    //Add a New Task
    func addtask(name : String, descr : String){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext? = appDel.managedObjectContext

        var NewTask = NSEntityDescription.insertNewObjectForEntityForName("TodoList", inManagedObjectContext: context!) as NSManagedObject
        NewTask.setValue(name, forKey: "name")
        NewTask.setValue(descr, forKey: "descr")
        context?.save(nil)
    }

    //List All Tasks
    func listalltasks(){
        tasks.removeAll(keepCapacity: 0)
        let request = NSFetchRequest(entityName: "TodoList")
        request.returnsObjectsAsFaults = false
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext!
        var results:NSArray! = context.executeFetchRequest(request, error: nil)
        for res in results{
            //var data = res as task
            tasks.append(task(name: res.name, descr: res.descr))
        }
    }

    //Update Task
    func updatetask(){

    }

    //Delete task
    func deletetask(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext? = appDel.managedObjectContext


    }
    
}
