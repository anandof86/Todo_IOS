//
//  FirstViewController.swift
//  Todo
//
//  Created by Anand on 9/21/14.
//  Copyright (c) 2014 qruize. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTask: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSFetchRequest(entityName: "TodoList")
        request.returnsObjectsAsFaults = false
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext!
        var results:NSArray! = context.executeFetchRequest(request, error: nil)
        if(results.count > 0){
            for res in results{
                println(res)
            }
        }else{
            println("No Obejct Found");
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        tblTask.reloadData()
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){

        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMgr.tasks.removeAtIndex(indexPath.row)
            tblTask.reloadData()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")

        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc

        return cell
    }

}

