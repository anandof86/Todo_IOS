//
//  TaskManager.swift
//  Todolist
//
//  Created by Anand on 9/21/14.
//  Copyright (c) 2014 qruize. All rights reserved.
//

import UIKit

var taskMgr:  TaskManager = TaskManager();

struct task {
    var name = "un-named"
    var desc = "un-descriped"
}

class TaskManager: NSObject {
    var tasks = [task]()

    func addtask(name : String, desc : String){
        tasks.append(task(name: name, desc: desc))
    }
    
}
