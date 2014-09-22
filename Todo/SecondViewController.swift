//
//  SecondViewController.swift
//  Todo
//
//  Created by Anand on 9/21/14.
//  Copyright (c) 2014 qruize. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtTask : UITextField!
    @IBOutlet var txtDesc : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }

    @IBAction func btnAddTask_click(sender : UIButton){
        taskMgr.addtask(txtTask.text, desc: txtDesc.text)
        self.view.endEditing(true);
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext? = appDel.managedObjectContext

        var NewTask = NSEntityDescription.insertNewObjectForEntityForName("TodoList", inManagedObjectContext: context!) as NSManagedObject
        NewTask.setValue(txtTask.text, forKey: "name")
        NewTask.setValue(txtDesc.text, forKey: "descr")
        context?.save(nil)
        println(NewTask)
        println("Task Saved")
        txtDesc.text = "";
        txtTask.text = "";
        self.tabBarController?.selectedIndex = 0
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool  {
        textField.resignFirstResponder();

        return true
    }

}

