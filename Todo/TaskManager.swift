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
    var descr = "un-descriped"
}

class TaskManager: NSObject {
    var tasks = [task]()

    func addtask(name : String, descr : String){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext? = appDel.managedObjectContext

        var NewTask = NSEntityDescription.insertNewObjectForEntityForName("TodoList", inManagedObjectContext: context!) as NSManagedObject
        NewTask.setValue(name, forKey: "name")
        NewTask.setValue(descr, forKey: "descr")
        context?.save(nil)
        println(NewTask)
        println("Task Saved")
    }

    func listalltasks(){
        let request = NSFetchRequest(entityName: "TodoList")
        request.returnsObjectsAsFaults = false
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext!
        var results:NSArray! = context.executeFetchRequest(request, error: nil)
        if(results.count > 0){
            for res in results{
                println("\(res)")
            }
        }else{
            println("No Obejct Found");
        }
    }
    
}
